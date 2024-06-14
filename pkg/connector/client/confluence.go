package client

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"net/http"
	"net/url"
	"strconv"
	"time"

	"github.com/conductorone/baton-sdk/pkg/uhttp"
)

const (
	maxResults               = 50
	minRatelimitWait         = 1 * time.Second                        // Minimum time to wait after a request was ratelimited before trying again
	maxRatelimitWait         = (2 * time.Minute) + (30 * time.Second) // Maximum time to wait after a request was ratelimited before erroring
	currentUserUrlPath       = "user/current"
	groupsListUrlPath        = "group"
	groupsMembersListUrlPath = "group/member"
	usersListUrlPath         = "users/list"
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
	httpClient *http.Client
	user       string
	apiKey     string
	apiBase    *url.URL
}

func NewConfluenceClient(ctx context.Context, user, apiKey, domain string) (*ConfluenceClient, error) {
	apiBase, err := url.Parse(fmt.Sprintf("https://%s/rest/api/", domain))
	if err != nil {
		return nil, err
	}

	httpClient, err := uhttp.NewClient(ctx, uhttp.WithLogger(true, nil))
	if err != nil {
		return nil, err
	}

	return &ConfluenceClient{
		httpClient: httpClient,
		apiBase:    apiBase,
		user:       user,
		apiKey:     apiKey,
	}, nil
}

// Verify returns an error if the current user isn't found.
func (c *ConfluenceClient) Verify(ctx context.Context) error {
	currentUserUrl, err := c.genURLNonPaginated(currentUserUrlPath)
	if err != nil {
		return err
	}

	var response *ConfluenceUser
	if err := c.get(ctx, currentUserUrl, &response); err != nil {
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
	pageSize int,
) ([]ConfluenceUser, string, error) {
	usersListUrl, err := c.genURL(pageToken, pageSize, usersListUrlPath)
	if err != nil {
		return nil, "", err
	}

	var response *confluenceUserList
	if err := c.get(ctx, usersListUrl, &response); err != nil {
		return nil, "", err
	}

	users := response.Results

	if len(users) == 0 {
		return users, "", nil
	}

	nextToken := incToken(pageToken, len(users))

	return users, nextToken, nil
}

// GetGroups uses pagination to get a list of groups from the global list.
func (c *ConfluenceClient) GetGroups(
	ctx context.Context,
	pageToken string,
	pageSize int,
) ([]ConfluenceGroup, string, error) {
	groupsListUrl, err := c.genURL(pageToken, pageSize, groupsListUrlPath)
	if err != nil {
		return nil, "", err
	}

	var response *confluenceGroupList
	if err := c.get(ctx, groupsListUrl, &response); err != nil {
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
	pageSize int,
	group string,
) ([]ConfluenceUser, string, error) {
	groupMembersUrl, err := c.genURL(
		pageToken,
		pageSize,
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
	if err := c.get(ctx, groupMembersUrl, &response); err != nil {
		return nil, "", err
	}

	users := response.Results

	if len(users) == 0 {
		return users, "", nil
	}

	nextToken := incToken(pageToken, len(users))

	return users, nextToken, nil
}

func (c *ConfluenceClient) get(ctx context.Context, url *url.URL, target interface{}) error {
	request, err := http.NewRequestWithContext(ctx, http.MethodGet, url.String(), nil)
	if err != nil {
		return err
	}

	request.SetBasicAuth(c.user, c.apiKey)

	for {
		response, err := c.httpClient.Do(request)
		if err != nil {
			return err
		}
		defer response.Body.Close()

		retryAfter := strToInt(response.Header.Get("Retry-After"))

		switch response.StatusCode {
		case http.StatusOK:
			if err := json.NewDecoder(response.Body).Decode(target); err != nil {
				return fmt.Errorf("failed to decode response body for '%s': %w", url, err)
			}
			return nil
		case http.StatusTooManyRequests:
			if err := wait(ctx, retryAfter); err != nil {
				return fmt.Errorf("confluence-connector: failed to wait for retry on '%s': %w", url, err)
			}
			continue
		case http.StatusServiceUnavailable:
			// Per the docs: transient 5XX errors should be treated as 429/too-many-requests if they have a retry header.
			// 503 errors were the only ones explicitly called out, but I guess it's possible for others too.
			// https://developer.atlassian.com/cloud/confluence/rate-limiting/
			if retryAfter != 0 {
				if err := wait(ctx, retryAfter); err != nil {
					return fmt.Errorf("confluence-connector: failed to wait for retry on '%s': %w", url, err)
				}
				continue
			}
		}

		body, err := io.ReadAll(response.Body)
		if err != nil {
			return fmt.Errorf("error reading non-200 response body: %w", err)
		}

		return &RequestError{
			URL:    url,
			Status: response.StatusCode,
			Body:   string(body),
		}
	}
}

func (c *ConfluenceClient) genURLNonPaginated(path string) (*url.URL, error) {
	parsed, err := url.Parse(path)
	if err != nil {
		return nil, fmt.Errorf("failed to parse request path '%s': %w", path, err)
	}
	u := c.apiBase.ResolveReference(parsed)
	return u, nil
}

func (c *ConfluenceClient) genURL(pageToken string, pageSize int, path string) (*url.URL, error) {
	parsed, err := url.Parse(path)
	if err != nil {
		return nil, fmt.Errorf("failed to parse request path '%s': %w", path, err)
	}

	u := c.apiBase.ResolveReference(parsed)

	maximum := pageSize
	if maximum == 0 || maximum > maxResults {
		maximum = maxResults
	}

	q := u.Query()
	q.Set("start", pageToken)
	q.Set("limit", strconv.Itoa(maximum))
	u.RawQuery = q.Encode()

	return u, nil
}

func wait(ctx context.Context, retryAfter int) error {
	// Wait must be within min/max window
	duration := min(
		max(
			time.Duration(retryAfter)*time.Second,
			minRatelimitWait,
		),
		maxRatelimitWait,
	)

	select {
	case <-time.After(duration):
		return nil
	case <-ctx.Done():
		return ctx.Err()
	}
}

func incToken(pageToken string, count int) string {
	token := strToInt(pageToken)

	token += count
	if token == 0 {
		return ""
	}

	return strconv.Itoa(token)
}

func strToInt(s string) int {
	i, err := strconv.Atoi(s)
	if err != nil {
		return 0
	}
	return i
}
