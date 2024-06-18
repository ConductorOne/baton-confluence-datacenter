package client

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	v2 "github.com/conductorone/baton-sdk/pb/c1/connector/v2"
	"github.com/conductorone/baton-sdk/pkg/helpers"
	"google.golang.org/protobuf/types/known/timestamppb"
	"io"
	"net/http"
	"net/url"
	"strconv"
	"strings"
	"time"

	"github.com/conductorone/baton-sdk/pkg/uhttp"
)

const (
	ResourcesPageSize        = 100
	currentUserUrlPath       = "user/current"
	groupsListUrlPath        = "group"
	groupsMembersListUrlPath = "group/member"
	usersListUrlPath         = "users/list"
	rfc7231RateLimitHeader   = "Retry-After"
)

type RequestError struct {
	Status int
	URL    *url.URL
	Body   string
}

func (r *RequestError) Error() string {
	return fmt.Sprintf("confluence-connector: request error. Status: %d, Url: %s, Body: %s", r.Status, r.URL, r.Body)
}

type ConfluenceClient struct {
	wrapper *uhttp.BaseHttpClient
	user    string
	apiKey  string
	apiBase *url.URL
}

func NewConfluenceClient(
	ctx context.Context,
	user string,
	apiKey string,
	hostname string,
) (*ConfluenceClient, error) {
	apiBase, err := url.Parse(strings.Trim(hostname, "/") + "/rest/api/")
	if err != nil {
		return nil, err
	}

	httpClient, err := uhttp.NewClient(ctx, uhttp.WithLogger(true, nil))
	if err != nil {
		return nil, err
	}

	return &ConfluenceClient{
		wrapper: uhttp.NewBaseHttpClient(httpClient),
		apiBase: apiBase,
		user:    user,
		apiKey:  apiKey,
	}, nil
}

// Verify returns an error if the current user isn't found.
func (c *ConfluenceClient) Verify(ctx context.Context) error {
	currentUserUrl, err := c.genURLNonPaginated(currentUserUrlPath)
	if err != nil {
		return err
	}

	var response *ConfluenceUser
	if _, err := c.get(ctx, currentUserUrl, &response); err != nil {
		return err
	}

	currentUser := response.UserKey
	if currentUser == "" {
		return errors.New("failed to find new user")
	}

	return nil
}

// GetUsers uses pagination to get a list of users from the global list.
func (c *ConfluenceClient) GetUsers(
	ctx context.Context,
	pageToken string,
) (
	[]ConfluenceUser,
	string,
	*v2.RateLimitDescription,
	error,
) {
	usersListUrl, err := c.genURL(pageToken, usersListUrlPath)
	if err != nil {
		return nil, "", nil, err
	}

	var response *confluenceUserList
	ratelimitData, err := c.get(ctx, usersListUrl, &response)
	if err != nil {
		return nil, "", ratelimitData, err
	}

	users := response.Results
	nextToken := incToken(pageToken, len(users))

	return users, nextToken, nil, nil
}

// GetGroups uses pagination to get a list of groups from the global list.
func (c *ConfluenceClient) GetGroups(
	ctx context.Context,
	pageToken string,
) ([]ConfluenceGroup, string, error) {
	groupsListUrl, err := c.genURL(pageToken, groupsListUrlPath)
	if err != nil {
		return nil, "", err
	}

	var response *confluenceGroupList
	if _, err := c.get(ctx, groupsListUrl, &response); err != nil {
		return nil, "", err
	}

	groups := response.Results

	if len(groups) == 0 {
		return groups, "", nil
	}

	nextToken := incToken(pageToken, len(groups))

	return groups, nextToken, nil
}

// GetGroupMembers uses pagination to get a list of users that belong to a given group.
func (c *ConfluenceClient) GetGroupMembers(
	ctx context.Context,
	pageToken string,
	group string,
) ([]ConfluenceUser, string, error) {
	groupMembersUrl, err := c.genURL(
		pageToken,
		fmt.Sprintf(
			"%v?name=%v",
			groupsMembersListUrlPath,
			group,
		),
	)
	if err != nil {
		return nil, "", err
	}

	var response *confluenceUserList
	if _, err := c.get(ctx, groupMembersUrl, &response); err != nil {
		return nil, "", err
	}

	users := response.Results

	if len(users) == 0 {
		return users, "", nil
	}

	nextToken := incToken(pageToken, len(users))

	return users, nextToken, nil
}

// get makes the actual HTTP calls to Confluence. It handles basic status code
// errors and decodes the response to the passed `target`.
func (c *ConfluenceClient) get(
	ctx context.Context,
	url *url.URL,
	target interface{},
) (*v2.RateLimitDescription, error) {
	request, err := http.NewRequestWithContext(ctx, http.MethodGet, url.String(), nil)
	if err != nil {
		return nil, err
	}

	request.SetBasicAuth(c.user, c.apiKey)

	ratelimitData := v2.RateLimitDescription{}
	response, err := c.wrapper.Do(request, WithConfluenceRatelimitData(&ratelimitData))
	if err != nil {
		return &ratelimitData, err
	}
	defer response.Body.Close()

	if response.StatusCode != http.StatusOK {
		body, err := io.ReadAll(response.Body)
		if err != nil {
			return nil, fmt.Errorf("error reading non-200 response body: %w", err)
		}

		return &ratelimitData,
			&RequestError{
				URL:    url,
				Status: response.StatusCode,
				Body:   string(body),
			}
	}

	if err := json.NewDecoder(response.Body).Decode(target); err != nil {
		return nil, fmt.Errorf("failed to decode response body for '%s': %w", url, err)
	}

	return nil, nil
}

func (c *ConfluenceClient) genURLNonPaginated(path string) (*url.URL, error) {
	parsed, err := url.Parse(path)
	if err != nil {
		return nil, fmt.Errorf("failed to parse request path '%s': %w", path, err)
	}
	u := c.apiBase.ResolveReference(parsed)
	return u, nil
}

func (c *ConfluenceClient) genURL(pageToken string, path string) (*url.URL, error) {
	parsed, err := url.Parse(path)
	if err != nil {
		return nil, fmt.Errorf("failed to parse request path '%s': %w", path, err)
	}

	u := c.apiBase.ResolveReference(parsed)

	q := u.Query()
	q.Set("start", pageToken)
	q.Set("limit", strconv.Itoa(ResourcesPageSize))
	u.RawQuery = q.Encode()

	return u, nil
}

func incToken(pageToken string, count int) string {
	// If we didn't get the full amount of users, always assume it was the last page.
	if count < ResourcesPageSize {
		return ""
	}

	return strconv.Itoa(strToInt(pageToken) + count)
}

func strToInt(s string) int {
	i, err := strconv.Atoi(s)
	if err != nil {
		return 0
	}
	return i
}

// WithConfluenceRatelimitData Per the docs: transient 5XX errors should be
// treated as 429/too-many-requests if they have a retry header. 503 errors were
// the only ones explicitly called out, but I guess it's possible for others too
// https://developer.atlassian.com/cloud/confluence/rate-limiting/
func WithConfluenceRatelimitData(resource *v2.RateLimitDescription) uhttp.DoOption {
	return func(response *uhttp.WrapperResponse) error {
		// TODO(marcos): After updating `ExtractRateLimitData()` to look for
		//  ratelimit header variants, we can remove the overwriting code.
		rateLimitData, err := helpers.ExtractRateLimitData(response.StatusCode, &response.Header)
		if err != nil {
			return err
		}

		resource.Limit = rateLimitData.Limit
		resource.Remaining = rateLimitData.Remaining
		resource.ResetAt = rateLimitData.ResetAt

		// Overwriting the `X-Ratelimit-Reset` header because Confluence uses `Retry-After`.
		var resetAt time.Time
		if reset := response.Header.Get(rfc7231RateLimitHeader); reset != "" {
			resetSeconds, err := strconv.ParseInt(reset, 10, 64)
			if err != nil {
				return err
			}

			resetAt = time.Now().Add(time.Second * time.Duration(resetSeconds))
			resource.ResetAt = timestamppb.New(resetAt)
		}
		return nil
	}
}
