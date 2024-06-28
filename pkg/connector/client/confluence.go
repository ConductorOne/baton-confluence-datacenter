package client

import (
	"bytes"
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"net/http"
	"net/url"
	"slices"
	"strconv"
	"strings"
	"time"

	v2 "github.com/conductorone/baton-sdk/pb/c1/connector/v2"
	"github.com/conductorone/baton-sdk/pkg/helpers"
	"github.com/conductorone/baton-sdk/pkg/uhttp"
	"github.com/grpc-ecosystem/go-grpc-middleware/logging/zap/ctxzap"
	"go.uber.org/zap"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

const (
	ResourcesPageSize                          = 100
	spacePermissionsListUrlPath                = "/rpc/json-rpc/confluenceservice-v2/getSpacePermissionSets"
	spacePermissionsAddUrlPath                 = "/rpc/json-rpc/confluenceservice-v2/addPermissionsToSpace"
	spacePermissionRemoveUrlPath               = "/rpc/json-rpc/confluenceservice-v2/removePermissionFromSpace"
	currentUserUrlPath                         = "/rest/api/user/current"
	groupsListUrlPath                          = "/rest/api/group"
	groupsMemberUpdateUrlPath                  = "/rest/api/user/%s/group/%s"
	groupsMembersListUrlPath                   = "/rest/api/group/%s/member"
	rfc7231RateLimitHeader                     = "Retry-After"
	spaceUpdateUrlPath                         = "/rest/api/space/%s"
	spacesListUrlPath                          = "/rest/api/space"
	usersListUrlPath                           = "/rest/api/user/list"
	ConfluenceCommentPermissionKey             = "COMMENT"
	ConfluenceCreateAttachmentPermissionKey    = "CREATEATTACHMENT"
	ConfluenceEditBlogPermissionKey            = "EDITBLOG"
	ConfluenceEditSpacePermissionKey           = "EDITSPACE"
	ConfluenceExportSpacePermissionKey         = "EXPORTSPACE"
	ConfluenceRemoveAttachmentPermissionKey    = "REMOVEATTACHMENT"
	ConfluenceRemoveBlogPermissionKey          = "REMOVEBLOG"
	ConfluenceRemoveCommentPermissionKey       = "REMOVECOMMENT"
	ConfluenceRemoveMailPermissionKey          = "REMOVEMAIL"
	ConfluenceRemoveOwnContentPermissionKey    = "REMOVEOWNCONTENT"
	ConfluenceRemovePagePermissionKey          = "REMOVEPAGE"
	ConfluenceSetPagePermissionsPermissionKey  = "SETPAGEPERMISSIONS"
	ConfluenceSetSpacePermissionsPermissionKey = "SETSPACEPERMISSIONS"
	ConfluenceViewSpacePermissionKey           = "VIEWSPACE"
)

type ConfluenceSpaceEntitlement struct {
	DisplayName string
	Key         string
	Name        string
}

// ConfluenceSpaceEntitlements hard-coding the permission types. In the real API
// the permissions depend on the space.
var ConfluenceSpaceEntitlements = []ConfluenceSpaceEntitlement{
	{
		Key:         ConfluenceCommentPermissionKey,
		DisplayName: "comment in",
		Name:        "add-comment",
	}, {
		Key:         ConfluenceCreateAttachmentPermissionKey,
		DisplayName: "create an attachment in",
		Name:        "add-attachment",
	}, {
		Key:         ConfluenceEditBlogPermissionKey,
		DisplayName: "edit an blog in",
		Name:        "edit-blog",
	}, {
		Key:         ConfluenceEditSpacePermissionKey,
		DisplayName: "edit",
		Name:        "edit-space",
	}, {
		Key:         ConfluenceExportSpacePermissionKey,
		DisplayName: "export",
		Name:        "export-space",
	}, {
		Key:         ConfluenceRemoveAttachmentPermissionKey,
		DisplayName: "remove an attachment from",
		Name:        "remove-attachment",
	}, {
		Key:         ConfluenceRemoveBlogPermissionKey,
		DisplayName: "remove a blog from",
		Name:        "remove-blog",
	}, {
		Key:         ConfluenceRemoveCommentPermissionKey,
		DisplayName: "remove a comment from",
		Name:        "remove-comment",
	}, {
		Key:         ConfluenceRemoveMailPermissionKey,
		DisplayName: "remove mail from",
		Name:        "remove-mail",
	}, {
		Key:         ConfluenceRemoveOwnContentPermissionKey,
		DisplayName: "remove their own content from",
		Name:        "remove-own-content",
	}, {
		Key:         ConfluenceRemovePagePermissionKey,
		DisplayName: "remove a page from",
		Name:        "remove-page",
	}, {
		Key:         ConfluenceSetPagePermissionsPermissionKey,
		DisplayName: "set page permissions for",
		Name:        "set-page-permissions",
	}, {
		Key:         ConfluenceSetSpacePermissionsPermissionKey,
		DisplayName: "set space permissions for",
		Name:        "set-space-permissions",
	}, {
		Key:         ConfluenceViewSpacePermissionKey,
		DisplayName: "view",
		Name:        "view",
	},
}

func (c *ConfluenceClient) ConfluenceSpaceEntitlements() []ConfluenceSpaceEntitlement {
	return ConfluenceSpaceEntitlements
}

func (c *ConfluenceClient) ConfluenceSpaceEntitlementByKey(key string) (
	*ConfluenceSpaceEntitlement,
	bool,
) {
	for _, entitlementEntry := range ConfluenceSpaceEntitlements {
		if entitlementEntry.Key == key {
			return &entitlementEntry, true
		}
	}
	return nil, false
}

func (c *ConfluenceClient) ConfluenceSpaceEntitlementByName(name string) (
	*ConfluenceSpaceEntitlement,
	bool,
) {
	for _, entitlementEntry := range ConfluenceSpaceEntitlements {
		if entitlementEntry.Name == name {
			return &entitlementEntry, true
		}
	}
	return nil, false
}

type RequestError struct {
	Status int
	URL    *url.URL
	Body   string
}

func (r *RequestError) Error() string {
	return fmt.Sprintf(
		"confluence-datacenter-connector: request error. Status: %d, Url: %s, Body: %s",
		r.Status,
		r.URL,
		r.Body,
	)
}

type ConfluenceClient struct {
	accessToken string
	apiBase     *url.URL
	password    string
	username    string
	wrapper     *uhttp.BaseHttpClient
}

func NewConfluenceClient(
	ctx context.Context,
	accessToken string,
	hostname string,
	password string,
	username string,
) (*ConfluenceClient, error) {
	apiBase, err := url.Parse(strings.Trim(hostname, "/"))
	if err != nil {
		return nil, err
	}

	httpClient, err := uhttp.NewClient(ctx, uhttp.WithLogger(true, nil))
	if err != nil {
		return nil, err
	}

	return &ConfluenceClient{
		accessToken: accessToken,
		apiBase:     apiBase,
		password:    password,
		username:    username,
		wrapper:     uhttp.NewBaseHttpClient(httpClient),
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
) (
	[]ConfluenceGroup,
	string,
	*v2.RateLimitDescription,
	error,
) {
	groupsListUrl, err := c.genURL(pageToken, groupsListUrlPath)
	if err != nil {
		return nil, "", nil, err
	}

	var response *confluenceGroupList
	ratelimitData, err := c.get(ctx, groupsListUrl, &response)
	if err != nil {
		return nil, "", ratelimitData, err
	}

	groups := response.Results

	nextToken := incToken(pageToken, len(groups))

	return groups, nextToken, ratelimitData, nil
}

// GetGroupMembers uses pagination to get a list of users that belong to a given group.
func (c *ConfluenceClient) GetGroupMembers(
	ctx context.Context,
	pageToken string,
	group string,
) (
	[]ConfluenceUser,
	string,
	*v2.RateLimitDescription,
	error,
) {
	groupMembersUrl, err := c.genURL(
		pageToken,
		groupsMembersListUrlPath,
		group,
	)
	if err != nil {
		return nil, "", nil, err
	}

	var response *confluenceUserList
	ratelimitData, err := c.get(ctx, groupMembersUrl, &response)
	if err != nil {
		return nil, "", ratelimitData, err
	}

	users := response.Results
	nextToken := incToken(pageToken, len(users))

	return users, nextToken, ratelimitData, nil
}

// AddGroupMember makes an idempotent PUT call.
func (c *ConfluenceClient) AddGroupMember(
	ctx context.Context,
	username string,
	groupName string,
) (
	*v2.RateLimitDescription,
	error,
) {
	addGroupMemberUrl, err := c.genURLNonPaginated(
		groupsMemberUpdateUrlPath,
		username,
		groupName,
	)
	if err != nil {
		return nil, err
	}

	return c.put(ctx, addGroupMemberUrl, nil)
}

func (c *ConfluenceClient) RemoveGroupMember(
	ctx context.Context,
	username string,
	groupName string,
) (
	*v2.RateLimitDescription,
	error,
) {
	removeGroupMemberUrl, err := c.genURLNonPaginated(
		groupsMemberUpdateUrlPath,
		username,
		groupName,
	)
	if err != nil {
		return nil, err
	}

	return c.delete(ctx, removeGroupMemberUrl, nil)
}

// GetSpaces uses pagination to get a list of spaces from the global list.
func (c *ConfluenceClient) GetSpaces(
	ctx context.Context,
	pageToken string,
) (
	[]ConfluenceSpace,
	string,
	*v2.RateLimitDescription,
	error,
) {
	spacesListUrl, err := c.genURL(pageToken, spacesListUrlPath)
	if err != nil {
		return nil, "", nil, err
	}

	var response *confluenceSpaceList
	ratelimitData, err := c.get(ctx, spacesListUrl, &response)
	if err != nil {
		return nil, "", ratelimitData, err
	}

	spaces := response.Results

	nextToken := incToken(pageToken, len(spaces))

	return spaces, nextToken, ratelimitData, nil
}

// AddSpace makes an idempotent PUT call.
func (c *ConfluenceClient) AddSpace(
	ctx context.Context,
	key string,
	name string,
	description string,
) (
	*v2.RateLimitDescription,
	error,
) {
	addSpaceUrl, err := c.genURLNonPaginated(spaceUpdateUrlPath)
	if err != nil {
		return nil, err
	}

	requestBody, err := json.Marshal(
		ConfluenceSpace{
			Key:  key,
			Name: name,
			Description: ConfluenceSpaceDescription{
				Plain: ConfluenceSpaceDescriptionValue{
					Value:          description,
					Representation: "plain",
				},
			},
		},
	)
	if err != nil {
		return nil, err
	}

	reader := bytes.NewReader(requestBody)

	var response *ConfluenceSpace
	return c.post(ctx, addSpaceUrl, &response, reader)
}

func (c *ConfluenceClient) RemoveSpace(
	ctx context.Context,
	key string,
) (
	*v2.RateLimitDescription,
	error,
) {
	removeGroupMemberUrl, err := c.genURLNonPaginated(
		spaceUpdateUrlPath,
		key,
	)
	if err != nil {
		return nil, err
	}

	return c.delete(ctx, removeGroupMemberUrl, nil)
}

func getParametersListsAsJSONBody(parameters ...interface{}) io.Reader {
	output, err := json.Marshal(parameters)
	if err != nil {
		output = []byte{}
	}
	return strings.NewReader(string(output))
}

// GetSpacePermissions Confluence space permissions are Content Restrictions.
func (c *ConfluenceClient) GetSpacePermissions(
	ctx context.Context,
	spaceName string,
) (
	[]ConfluenceSpacePermissionList,
	*v2.RateLimitDescription,
	error,
) {
	spacePermissionsListUrl, err := c.genURLNonPaginated(spacePermissionsListUrlPath)
	if err != nil {
		return nil, nil, err
	}

	body := getParametersListsAsJSONBody(spaceName)

	var response *[]ConfluenceSpacePermissionList
	ratelimitData, err := c.post(
		ctx,
		spacePermissionsListUrl,
		&response,
		body,
	)
	if err != nil {
		return nil, ratelimitData, err
	}

	spaces := make([]ConfluenceSpacePermissionList, 0)
	spaces = append(spaces, *response...)

	return spaces, ratelimitData, nil
}

func (c *ConfluenceClient) AddSpacePermission(
	ctx context.Context,
	spaceName string,
	entityName string,
	permissionName string,
) (
	*v2.RateLimitDescription,
	error,
) {
	spacePermissionsListUrl, err := c.genURLNonPaginated(spacePermissionsAddUrlPath)
	if err != nil {
		return nil, err
	}

	body := getParametersListsAsJSONBody(
		[]string{permissionName},
		entityName,
		spaceName,
	)

	var response bool
	ratelimitData, err := c.post(
		ctx,
		spacePermissionsListUrl,
		&response,
		body,
	)
	if err != nil {
		return ratelimitData, err
	}

	return ratelimitData, nil
}

func (c *ConfluenceClient) RemoveSpacePermission(
	ctx context.Context,
	spaceName string,
	entityName string,
	permissionKey string,
) (
	*v2.RateLimitDescription,
	error,
) {
	spacePermissionsListUrl, err := c.genURLNonPaginated(spacePermissionRemoveUrlPath)
	if err != nil {
		return nil, err
	}

	body := getParametersListsAsJSONBody(
		permissionKey,
		entityName,
		spaceName,
	)

	var response bool
	ratelimitData, err := c.post(
		ctx,
		spacePermissionsListUrl,
		&response,
		body,
	)
	if err != nil {
		return ratelimitData, err
	}

	return ratelimitData, nil
}

func isRatelimited(
	ratelimitStatus v2.RateLimitDescription_Status,
	statusCode int,
) bool {
	return slices.Contains(
		[]v2.RateLimitDescription_Status{
			v2.RateLimitDescription_STATUS_OVERLIMIT,
			v2.RateLimitDescription_STATUS_ERROR,
		},
		ratelimitStatus,
	) || slices.Contains(
		[]int{
			http.StatusTooManyRequests,
			http.StatusGatewayTimeout,
			http.StatusServiceUnavailable,
		},
		statusCode,
	)
}

// makeRequest makes the actual HTTP request to Confluence. It handles basic
// status code errors and decodes the response to the passed `target`.
func (c *ConfluenceClient) makeRequest(
	ctx context.Context,
	url *url.URL,
	target interface{},
	method string,
	requestBody io.Reader,
) (*v2.RateLimitDescription, error) {
	logger := ctxzap.Extract(ctx)
	logger.Debug(
		"making request",
		zap.String("url", url.String()),
		zap.String("method", method),
	)
	request, err := http.NewRequestWithContext(
		ctx,
		method,
		url.String(),
		requestBody,
	)
	if err != nil {
		return nil, err
	}

	// Auth token has priority.
	if c.accessToken != "" {
		request.Header.Set(
			"Authorization",
			fmt.Sprintf("Bearer %s", c.accessToken),
		)
	} else {
		request.SetBasicAuth(c.username, c.password)
	}

	ratelimitData := v2.RateLimitDescription{}

	doOptions := []uhttp.DoOption{
		WithConfluenceRatelimitData(&ratelimitData),
	}
	// If `target` is nil, we expected a "No Content" response and don't want
	// `WithJSONResponse()` to fail and return an error.
	if target != nil {
		doOptions = append(doOptions, uhttp.WithJSONResponse(target))
	}

	// This must be explicitly set for the JSON-RPC server to not error.
	request.Header.Set("Content-Type", "application/json")

	response, err := c.wrapper.Do(request, doOptions...)

	if err == nil {
		return &ratelimitData, nil
	}

	if response == nil {
		return nil, err
	}
	defer response.Body.Close()

	// If we get ratelimit data back (e.g. the "Retry-After" header) or a
	// "ratelimit-like" status code, then return a recoverable gRPC code.
	if isRatelimited(ratelimitData.Status, response.StatusCode) {
		return &ratelimitData, status.Error(codes.Unavailable, response.Status)
	}

	// If it's some other error, it is unrecoverable.
	responseBody, err := io.ReadAll(response.Body)
	if err != nil {
		return nil, err
	}

	return nil, &RequestError{
		URL:    url,
		Status: response.StatusCode,
		Body:   string(responseBody),
	}
}

func (c *ConfluenceClient) get(
	ctx context.Context,
	url *url.URL,
	target interface{},
) (*v2.RateLimitDescription, error) {
	return c.makeRequest(ctx, url, target, http.MethodGet, nil)
}

func (c *ConfluenceClient) post(
	ctx context.Context,
	url *url.URL,
	target interface{},
	body io.Reader,
) (*v2.RateLimitDescription, error) {
	return c.makeRequest(ctx, url, target, http.MethodPost, body)
}

// put does not take a request body because it is only used for adding a user to
// a group and that API doesn't take a request body.
func (c *ConfluenceClient) put(
	ctx context.Context,
	url *url.URL,
	target interface{},
) (*v2.RateLimitDescription, error) {
	return c.makeRequest(ctx, url, target, http.MethodPut, nil)
}

func (c *ConfluenceClient) delete(
	ctx context.Context,
	url *url.URL,
	target interface{},
) (*v2.RateLimitDescription, error) {
	return c.makeRequest(ctx, url, target, http.MethodDelete, nil)
}

func (c *ConfluenceClient) genURLNonPaginated(
	path string,
	pathParameters ...any,
) (*url.URL, error) {
	path = fmt.Sprintf(path, pathParameters...)
	parsed, err := url.Parse(path)
	if err != nil {
		return nil, fmt.Errorf("failed to parse request path '%s': %w", path, err)
	}
	u := c.apiBase.ResolveReference(parsed)
	return u, nil
}

func (c *ConfluenceClient) genURL(
	pageToken string,
	path string,
	pathParameters ...any,
) (*url.URL, error) {
	path = fmt.Sprintf(path, pathParameters...)
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
