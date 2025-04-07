package connector

import (
	"context"
	"fmt"
	"strings"
	"sync"

	"github.com/conductorone/baton-confluence-datacenter/pkg/connector/client"
	v2 "github.com/conductorone/baton-sdk/pb/c1/connector/v2"
	"github.com/conductorone/baton-sdk/pkg/annotations"
	"github.com/conductorone/baton-sdk/pkg/pagination"
	"github.com/conductorone/baton-sdk/pkg/types/entitlement"
	"github.com/conductorone/baton-sdk/pkg/types/grant"
	"github.com/conductorone/baton-sdk/pkg/types/resource"
	"github.com/grpc-ecosystem/go-grpc-middleware/logging/zap/ctxzap"
	"go.uber.org/zap"
)

const (
	groupMemberEntitlement = "member"
)

var (
	groupMembersCacheOnce     sync.Once
	groupMembersCacheInstance *groupMembersCache
	hasGroupWithSlash         bool
)

type groupMembersCache struct {
	cache  map[string][]client.ConfluenceUser
	client client.ConfluenceClient
	mutex  sync.RWMutex
}

type groupBuilder struct {
	client                       client.ConfluenceClient
	cache                        *groupMembersCache
	disableSlashSupportGroupName bool
}

func (o *groupBuilder) ResourceType(_ context.Context) *v2.ResourceType {
	return groupResourceType
}

// MakeGetGroupsCall is a hook for mocking the client in tests.
var MakeGetGroupsCall = func(ctx context.Context, confluenceClient client.ConfluenceClient, pageToken string) ([]client.ConfluenceGroup, string, *v2.RateLimitDescription, error) {
	return confluenceClient.GetGroups(ctx, pageToken)
}

// List returns all the groups from the database as resource objects.
// Groups include a GroupTrait because they are the 'shape' of a standard group.
func (o *groupBuilder) List(
	ctx context.Context,
	_ *v2.ResourceId,
	pToken *pagination.Token,
) (
	[]*v2.Resource,
	string,
	annotations.Annotations,
	error,
) {
	logger := ctxzap.Extract(ctx)
	// Reset the cache if we're starting a new sync.
	// This cache is a workaround for a Confluence API limitation. See: https://jira.atlassian.com/browse/CONFCLOUD-68869
	if !o.disableSlashSupportGroupName && pToken.Token == "" {
		ResetGroupMembersCache()
		hasGroupWithSlash = false
	}

	groups, nextToken, ratelimitData, err := MakeGetGroupsCall(ctx, o.client, pToken.Token)
	outputAnnotations := WithRateLimitAnnotations(ratelimitData)
	if err != nil {
		return nil, "", outputAnnotations, err
	}

	rv := make([]*v2.Resource, 0)
	for _, group := range groups {
		// If the group name contains a slash and support slash in group name is not enabled, enable it
		// This is a workaround for a Confluence API limitation. See: https://jira.atlassian.com/browse/CONFCLOUD-68869
		if !o.disableSlashSupportGroupName && !hasGroupWithSlash && strings.Contains(group.Name, "/") {
			logger.Info(
				"baton-confluence-datacenter: support slash in group name is enabled, this is a workaround for a Confluence API limitation. See: https://jira.atlassian.com/browse/CONFCLOUD-68869",
				zap.String("group_name", group.Name),
			)
			hasGroupWithSlash = true
		}

		groupCopy := group
		ur, err := groupResource(ctx, &groupCopy)
		if err != nil {
			return nil, "", nil, err
		}

		rv = append(rv, ur)
	}

	return rv, nextToken, outputAnnotations, nil
}

// Entitlements each group resource has a single entitlement: membership.
func (o *groupBuilder) Entitlements(
	ctx context.Context,
	resource *v2.Resource,
	_ *pagination.Token,
) (
	[]*v2.Entitlement,
	string,
	annotations.Annotations,
	error,
) {
	logger := ctxzap.Extract(ctx)
	logger.Debug(
		"Starting call to Groups.Entitlements",
		zap.String("resource.DisplayName", resource.DisplayName),
		zap.String("resource.Id.Resource", resource.Id.Resource),
	)
	entitlements := []*v2.Entitlement{
		entitlement.NewAssignmentEntitlement(
			resource,
			groupMemberEntitlement,
			entitlement.WithGrantableTo(userResourceType),
			entitlement.WithDisplayName(
				fmt.Sprintf("%s Group Member", resource.DisplayName),
			),
			entitlement.WithDescription(
				fmt.Sprintf(
					"Is member of the %s group in Confluence Data Center",
					resource.DisplayName,
				),
			),
		),
	}

	return entitlements, "", nil, nil
}

var MakeGetGroupMembersCall = func(ctx context.Context, confluenceClient client.ConfluenceClient, pageToken, groupName string) ([]client.ConfluenceUser, string, *v2.RateLimitDescription, error) {
	return confluenceClient.GetGroupMembers(ctx, pageToken, groupName)
}

// Grants the grants for a given group are the current memberships.
func (o *groupBuilder) Grants(
	ctx context.Context,
	resource *v2.Resource,
	pToken *pagination.Token,
) (
	[]*v2.Grant,
	string,
	annotations.Annotations,
	error,
) {
	logger := ctxzap.Extract(ctx)
	nextPage := ""
	outputAnnotations := WithRateLimitAnnotations(nil)
	var users []client.ConfluenceUser

	// When we've detected groups containing forward slashes ('/') in the system,
	// we cannot use the direct group members API endpoint for any group lookups
	// due to a Confluence API limitation (see: https://jira.atlassian.com/browse/CONFCLOUD-68869).
	// Instead, we use a cached approach that:
	// 1. Lists all users in the system
	// 2. For each user, fetches their group memberships
	// 3. Builds a reverse mapping of group -> members
	if !o.disableSlashSupportGroupName && hasGroupWithSlash {
		logger.Debug("baton-confluence-datacenter: using cached group members list due to Confluence API limitation")
		groupMembers, err := getGroupMembersCache(o.client).GetGroupMembersList(ctx)
		if err != nil {
			return nil, "", nil, err
		}
		users = groupMembers[resource.DisplayName]
	} else {
		logger.Debug("baton-confluence-datacenter: using standard API endpoint for group members list due to Confluence API limitation")
		// If no groups with slashes have been detected in the system, we use the standard API endpoint
		// to directly fetch members which is more efficient for individual group lookups
		token := ""
		bag := &pagination.Bag{}
		err := bag.Unmarshal(pToken.Token)
		if err != nil {
			return nil, "", nil, err
		}
		if bag.Current() == nil {
			bag.Push(pagination.PageState{
				ResourceTypeID: groupResourceType.Id,
			})
		}

		var ratelimitData *v2.RateLimitDescription
		users, token, ratelimitData, err = MakeGetGroupMembersCall(
			ctx,
			o.client,
			bag.PageToken(),
			resource.DisplayName,
		)
		outputAnnotations = WithRateLimitAnnotations(ratelimitData)
		if err != nil {
			return nil, "", outputAnnotations, err
		}

		nextPage, err = bag.NextToken(token)
		if err != nil {
			return nil, "", nil, err
		}
	}

	var groups []*v2.Grant
	for _, user := range users {
		groups = append(groups, grant.NewGrant(
			resource,
			groupMemberEntitlement,
			&v2.ResourceId{
				ResourceType: userResourceType.Id,
				Resource:     user.UserKey,
			},
		))
	}

	return groups, nextPage, outputAnnotations, nil
}

// MakeGetUserByKeyCall is a hook for mocking the client in tests.
var MakeGetUserByKeyCall = func(ctx context.Context, confluenceClient client.ConfluenceClient, userKey string) (*client.ConfluenceUser, error) {
	return confluenceClient.GetUserByKey(ctx, userKey)
}

func (o *groupBuilder) Grant(
	ctx context.Context,
	principal *v2.Resource,
	entitlement *v2.Entitlement,
) (annotations.Annotations, error) {
	logger := ctxzap.Extract(ctx)

	if principal.Id.ResourceType != userResourceType.Id {
		logger.Warn(
			"baton-confluence-datacenter: only users can be granted group membership",
			zap.String("principal_type", principal.Id.ResourceType),
			zap.String("principal_id", principal.Id.Resource),
		)
		return nil, fmt.Errorf("baton-confluence-datacenter: only users can be granted group membership")
	}

	// Check for slash in group name. This is a workaround for a Confluence API limitation. See: https://jira.atlassian.com/browse/CONFCLOUD-68869
	if strings.Contains(entitlement.Resource.Id.Resource, "/") {
		logger.Warn(
			"baton-confluence-datacenter: cannot grant membership to groups containing '/' in their name",
			zap.String("group_name", entitlement.Resource.Id.Resource),
		)
		return nil, fmt.Errorf(
			"baton-confluence-datacenter: groups containing '/' in their name are not supported for grant operations " +
				"due to Confluence API limitations. See: https://jira.atlassian.com/browse/CONFCLOUD-68869",
		)
	}

	userDetail, err := MakeGetUserByKeyCall(ctx, o.client, principal.Id.Resource)
	if err != nil {
		return nil, err
	}

	// Check for slash in username. This is a workaround for a Confluence API limitation. See: https://jira.atlassian.com/browse/CONFCLOUD-68869
	if strings.Contains(userDetail.Username, "/") {
		logger.Warn(
			"baton-confluence-datacenter: cannot grant membership to users with '/' in their username",
			zap.String("username", userDetail.Username),
		)
		return nil, fmt.Errorf(
			"baton-confluence-datacenter: users with '/' in their username are not supported for grant operations " +
				"due to Confluence API limitations. See: https://jira.atlassian.com/browse/CONFCLOUD-68869",
		)
	}

	ratelimitData, err := o.client.AddGroupMember(
		ctx,
		userDetail.Username,
		entitlement.Resource.Id.Resource,
	)
	outputAnnotations := WithRateLimitAnnotations(ratelimitData)
	return outputAnnotations, err
}

func (o *groupBuilder) Revoke(
	ctx context.Context,
	grant *v2.Grant,
) (annotations.Annotations, error) {
	logger := ctxzap.Extract(ctx)

	ent := grant.Entitlement
	principal := grant.Principal

	if principal.Id.ResourceType != userResourceType.Id {
		logger.Warn(
			"baton-confluence-datacenter: only users can have group membership revoked",
			zap.String("principal_type", principal.Id.ResourceType),
			zap.String("principal_id", principal.Id.Resource),
		)
		return nil, fmt.Errorf("baton-confluence-datacenter: only users can have group membership revoked")
	}

	// Check for slash in group name. This is a workaround for a Confluence API limitation. See: https://jira.atlassian.com/browse/CONFCLOUD-68869
	if strings.Contains(ent.Resource.Id.Resource, "/") {
		logger.Warn(
			"baton-confluence-datacenter: cannot revoke membership from groups containing '/' in their name",
			zap.String("group_name", ent.Resource.Id.Resource),
		)
		return nil, fmt.Errorf(
			"baton-confluence-datacenter: groups with '/' in their name are not supported for revoke operations " +
				"due to Confluence API limitations. See: https://jira.atlassian.com/browse/CONFCLOUD-68869",
		)
	}

	userDetail, err := MakeGetUserByKeyCall(ctx, o.client, principal.Id.Resource)
	if err != nil {
		return nil, err
	}

	// Check for slash in username. This is a workaround for a Confluence API limitation. See: https://jira.atlassian.com/browse/CONFCLOUD-68869
	if strings.Contains(userDetail.Username, "/") {
		logger.Warn(
			"baton-confluence-datacenter: cannot revoke membership from users with '/' in their username",
			zap.String("username", userDetail.Username),
		)
		return nil, fmt.Errorf(
			"baton-confluence-datacenter: users with '/' in their username are not supported for revoke operations " +
				"due to Confluence API limitations. See: https://jira.atlassian.com/browse/CONFCLOUD-68869",
		)
	}

	ratelimitData, err := o.client.RemoveGroupMember(
		ctx,
		userDetail.Username,
		ent.Resource.Id.Resource,
	)
	outputAnnotations := WithRateLimitAnnotations(ratelimitData)
	return outputAnnotations, err
}

func newGroupBuilder(cclient client.ConfluenceClient, disableSlashSupportGroupName bool) *groupBuilder {
	return &groupBuilder{
		client:                       cclient,
		cache:                        getGroupMembersCache(cclient),
		disableSlashSupportGroupName: disableSlashSupportGroupName,
	}
}

func groupResource(_ context.Context, group *client.ConfluenceGroup) (*v2.Resource, error) {
	createdResource, err := resource.NewGroupResource(
		group.Name,
		groupResourceType,
		group.Name,
		[]resource.GroupTraitOption{
			resource.WithGroupProfile(
				map[string]interface{}{
					"group_name": group.Name,
					"group_type": group.Type,
				},
			),
		},
	)
	if err != nil {
		return nil, err
	}

	return createdResource, nil
}

// ******************************************
// Group Members Cache
// This cache is implemented as a workaround for a Confluence API limitation
// where the direct group members endpoint does not support group names containing
// forward slashes ('/'). Instead, we build the membership list by querying all
// users and their group memberships.
// ******************************************

// getGroupMembersCache returns a singleton instance of the groupMembersCache.
func getGroupMembersCache(cclient client.ConfluenceClient) *groupMembersCache {
	groupMembersCacheOnce.Do(func() {
		groupMembersCacheInstance = &groupMembersCache{
			cache:  make(map[string][]client.ConfluenceUser),
			client: cclient,
			mutex:  sync.RWMutex{},
		}
	})
	return groupMembersCacheInstance
}

// ResetGroupMembersCache replaces the Once instance with a new one.
func ResetGroupMembersCache() {
	groupMembersCacheInstance = nil
	groupMembersCacheOnce = sync.Once{}
}

// MakeGetGroupsByUserKeyCall is a hook for mocking the client in tests.
var MakeGetGroupsByUserKeyCall = func(ctx context.Context, confluenceClient client.ConfluenceClient, pageToken, userKey string) ([]client.ConfluenceGroup, string, *v2.RateLimitDescription, error) {
	return confluenceClient.GetGroupsByUserKey(ctx, pageToken, userKey)
}

// GetGroupMembersList uses the cache.
func (c *groupMembersCache) GetGroupMembersList(ctx context.Context) (map[string][]client.ConfluenceUser, error) {
	c.mutex.RLock()
	if len(c.cache) > 0 {
		defer c.mutex.RUnlock()
		return c.cache, nil
	}
	c.mutex.RUnlock()

	c.mutex.Lock()
	defer c.mutex.Unlock()

	// Double-check after acquiring write lock
	if len(c.cache) > 0 {
		return c.cache, nil
	}

	// Existing GetGroupMembersList logic here, but store result in c.cache
	groupMembers := make(map[string][]client.ConfluenceUser)
	userPageToken := ""
	// Paginate through all users
	for {
		users, userNextToken, _, err := MakeGetUsersCall(ctx, c.client, userPageToken)
		if err != nil {
			return nil, fmt.Errorf("failed to get users: %w", err)
		}

		// Process users in current page
		for _, user := range users {
			groupPageToken := ""
			// Paginate through all groups for the user is member of
			for {
				groups, groupNextToken, _, err := MakeGetGroupsByUserKeyCall(ctx, c.client, groupPageToken, user.UserKey)
				if err != nil {
					return nil, fmt.Errorf("failed to get groups for user %s: %w", user.Username, err)
				}

				// Add user to each group they belong to
				for _, group := range groups {
					if _, exists := groupMembers[group.Name]; !exists {
						groupMembers[group.Name] = make([]client.ConfluenceUser, 0)
					}
					groupMembers[group.Name] = append(groupMembers[group.Name], user)
				}

				// Break if no more pages
				if groupNextToken == "" {
					break
				}
				groupPageToken = groupNextToken
			}
		}

		// Break if no more pages
		if userNextToken == "" {
			break
		}
		userPageToken = userNextToken
	}

	c.cache = groupMembers
	return groupMembers, nil
}
