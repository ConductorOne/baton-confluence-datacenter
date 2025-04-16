package connector

import (
	"context"
	"fmt"
	"strings"
	"sync"
	"time"

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

type groupBuilder struct {
	confluenceService client.ConfluenceService
	// If true, we will not support groups with slashes in the name
	disableSlashSupportConfig bool
	// We use variable to track if we've detected a group with a slash in the name
	slashInGroupNameDetected bool
	// We use a map to cache group to members
	groupToMembersCache      map[string][]client.ConfluenceUser
	groupToMembersCacheMutex sync.RWMutex
	groupToMembersCacheTTL   time.Duration
	cacheLastUpdated         time.Time
}

func (o *groupBuilder) ResourceType(_ context.Context) *v2.ResourceType {
	return groupResourceType
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
	if !o.disableSlashSupportConfig && pToken.Token == "" {
		o.slashInGroupNameDetected = false
		o.cleanCache()
	}

	groups, nextToken, ratelimitData, err := o.confluenceService.GetGroups(ctx, pToken.Token)
	outputAnnotations := WithRateLimitAnnotations(ratelimitData)
	if err != nil {
		return nil, "", outputAnnotations, err
	}

	rv := make([]*v2.Resource, 0)
	for _, group := range groups {
		// If the group name contains a slash and support slash in group name is not enabled, enable it
		// This is a workaround for a Confluence API limitation. See: https://jira.atlassian.com/browse/CONFCLOUD-68869
		if !o.disableSlashSupportConfig && !o.slashInGroupNameDetected && strings.Contains(group.Name, "/") {
			logger.Info(
				"baton-confluence-datacenter: support slash in group name is enabled, this is a workaround for a Confluence API limitation. See: https://jira.atlassian.com/browse/CONFCLOUD-68869",
				zap.String("group_name", group.Name),
			)
			o.slashInGroupNameDetected = true
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
	if !o.disableSlashSupportConfig && o.slashInGroupNameDetected {
		logger.Debug("baton-confluence-datacenter: using cached group members list due to Confluence API limitation")
		groupMembers, err := o.getGroupToMembersCache(ctx)
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
		users, token, ratelimitData, err = o.confluenceService.GetGroupMembers(
			ctx,
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

	userDetail, err := o.confluenceService.GetUserByKey(ctx, principal.Id.Resource)
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

	ratelimitData, err := o.confluenceService.AddGroupMember(
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

	userDetail, err := o.confluenceService.GetUserByKey(ctx, principal.Id.Resource)
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

	ratelimitData, err := o.confluenceService.RemoveGroupMember(
		ctx,
		userDetail.Username,
		ent.Resource.Id.Resource,
	)
	outputAnnotations := WithRateLimitAnnotations(ratelimitData)
	return outputAnnotations, err
}

func newGroupBuilder(cclient client.ConfluenceClient, disableSlashSupportConfig bool) *groupBuilder {
	return &groupBuilder{
		confluenceService:         client.NewConfluenceService(cclient),
		disableSlashSupportConfig: disableSlashSupportConfig,
		slashInGroupNameDetected:  false,
		groupToMembersCache:       make(map[string][]client.ConfluenceUser),
		groupToMembersCacheMutex:  sync.RWMutex{},
		groupToMembersCacheTTL:    GroupMembersCacheTTL,
		cacheLastUpdated:          time.Time{},
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

// isCacheValid checks if the cache is still valid based on TTL and content.
func (o *groupBuilder) isCacheValid() bool {
	return time.Since(o.cacheLastUpdated) < o.groupToMembersCacheTTL && len(o.groupToMembersCache) > 0
}

// getGroupToMembersCache retrieves the group membership cache, rebuilding if necessary.
func (o *groupBuilder) getGroupToMembersCache(ctx context.Context) (map[string][]client.ConfluenceUser, error) {
	// First try with read lock for efficiency.
	o.groupToMembersCacheMutex.RLock()
	if o.isCacheValid() {
		defer o.groupToMembersCacheMutex.RUnlock()
		return o.groupToMembersCache, nil
	}
	o.groupToMembersCacheMutex.RUnlock()

	// Cache invalid or empty, acquire write lock to update it.
	o.groupToMembersCacheMutex.Lock()
	defer o.groupToMembersCacheMutex.Unlock()

	// Double-check after acquiring write lock (standard double-checked locking pattern).
	if o.isCacheValid() {
		return o.groupToMembersCache, nil
	}

	// Cache needs to be updated.
	newCache, err := o.buildGroupMembershipCache(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to build group membership cache: %w", err)
	}

	// Update the cache.
	o.groupToMembersCache = newCache
	o.cacheLastUpdated = time.Now()

	return o.groupToMembersCache, nil
}

// getGroupMembershipsForUser fetches all groups a user belongs to and updates the cache map.
func (o *groupBuilder) getGroupMembershipsForUser(
	ctx context.Context,
	user client.ConfluenceUser,
	groupMembers map[string][]client.ConfluenceUser,
) error {
	pageToken := ""

	for {
		// Get the groups this user belongs to.
		groups, nextToken, ratelimitData, err := o.confluenceService.GetGroupsByUserKey(ctx, pageToken, user.UserKey)

		// Handle rate limit errors specifically.
		if err != nil {
			// Check if this is a rate limit error by examining the status.
			if ratelimitData != nil && (ratelimitData.Status == v2.RateLimitDescription_STATUS_OVERLIMIT) {
				logger := ctxzap.Extract(ctx)
				waitTime := time.Until(ratelimitData.ResetAt.AsTime())

				// Log that we're waiting for rate limit to reset
				logger.Info(
					"Rate limit hit while fetching group memberships, waiting before retry",
					zap.String("username", user.Username),
					zap.Duration("wait_time", waitTime),
					zap.Time("reset_at", ratelimitData.ResetAt.AsTime()),
				)

				// Wait until reset time plus a small buffer
				select {
				case <-time.After(waitTime + 1*time.Second):
					// Continue the loop without advancing the pageToken.
					continue
				case <-ctx.Done():
					// Context was canceled while waiting.
					return ctx.Err()
				}
			}

			// For non-rate-limit errors, return with proper context
			return fmt.Errorf("failed to get groups for user %s: %w", user.Username, err)
		}

		// Add this user to each group they belong to.
		for _, group := range groups {
			if _, exists := groupMembers[group.Name]; !exists {
				groupMembers[group.Name] = make([]client.ConfluenceUser, 0)
			}
			groupMembers[group.Name] = append(groupMembers[group.Name], user)
		}

		// If no more pages, exit loop.
		if nextToken == "" {
			break
		}
		pageToken = nextToken
	}

	return nil
}

// buildGroupMembershipCache creates a complete map of group->members by processing all users.
func (o *groupBuilder) buildGroupMembershipCache(ctx context.Context) (map[string][]client.ConfluenceUser, error) {
	// Initialize empty cache.
	groupMembers := make(map[string][]client.ConfluenceUser)
	pageToken := ""

	// Process all users in the system.
	for {
		// Get a page of users.
		users, nextToken, ratelimitData, err := o.confluenceService.GetUsers(ctx, pageToken)

		// Handle rate limit errors specifically.
		if err != nil {
			// Check if this is a rate limit error by examining the status.
			if ratelimitData != nil && (ratelimitData.Status == v2.RateLimitDescription_STATUS_OVERLIMIT) {
				logger := ctxzap.Extract(ctx)
				waitTime := time.Until(ratelimitData.ResetAt.AsTime())

				// Log that we're waiting for rate limit to reset.
				logger.Info(
					"Rate limit hit while building group cache, waiting before retry",
					zap.Duration("wait_time", waitTime),
					zap.Time("reset_at", ratelimitData.ResetAt.AsTime()),
				)

				// Wait until reset time plus a small buffer.
				select {
				case <-time.After(waitTime + 1*time.Second):
					// Continue the loop without advancing the pageToken.
					continue
				case <-ctx.Done():
					// Context was canceled while waiting.
					return nil, ctx.Err()
				}
			}

			// For non-rate-limit errors, return with proper context.
			return nil, fmt.Errorf("failed to get users: %w", err)
		}

		// For each user, get their group memberships.
		for _, user := range users {
			if err := o.getGroupMembershipsForUser(ctx, user, groupMembers); err != nil {
				return nil, err
			}
		}

		// If no more pages of users, we're done.
		if nextToken == "" {
			break
		}
		pageToken = nextToken
	}

	return groupMembers, nil
}

// cleanCache cleans the cache.
func (o *groupBuilder) cleanCache() {
	o.groupToMembersCache = make(map[string][]client.ConfluenceUser)
	o.cacheLastUpdated = time.Time{}
}
