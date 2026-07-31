package connector

import (
	"context"
	"fmt"
	"strings"

	"github.com/conductorone/baton-confluence-datacenter/pkg/connector/client"
	v2 "github.com/conductorone/baton-sdk/pb/c1/connector/v2"
	"github.com/conductorone/baton-sdk/pkg/annotations"
	"github.com/conductorone/baton-sdk/pkg/pagination"
	"github.com/conductorone/baton-sdk/pkg/types/entitlement"
	"github.com/conductorone/baton-sdk/pkg/types/resource"
	"github.com/grpc-ecosystem/go-grpc-middleware/logging/zap/ctxzap"
	"go.uber.org/zap"
)

const (
	groupMemberEntitlement = "member"
)

type groupBuilder struct {
	confluenceService client.ConfluenceService
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
	groups, nextToken, ratelimitData, err := o.confluenceService.GetGroups(ctx, pToken.Token)
	outputAnnotations := WithRateLimitAnnotations(ratelimitData)
	if err != nil {
		return nil, "", outputAnnotations, err
	}

	rv := make([]*v2.Resource, 0)
	for _, group := range groups {
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

// Grants returns no grants for group resources, as group memberships are handled through user resources instead.
//
// The implementation intentionally returns grants from the user perspective using "/rest/api/user/memberof?key={{userKey}}"
// rather than "/rest/api/group/{{groupName}}/member" because:
//   - Group names containing forward slashes ('/') cannot be queried via the group endpoint
//   - Querying from the user perspective provides better API efficiency
//   - Avoids maintaining a separate group-to-member relationship cache
//
// For group membership information, see the Grants method in the userBuilder struct.
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
	return nil, "", nil, nil
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

func newGroupBuilder(cclient client.ConfluenceClient) *groupBuilder {
	return &groupBuilder{
		confluenceService: client.NewConfluenceService(cclient),
	}
}

func groupResource(_ context.Context, group *client.ConfluenceGroup) (*v2.Resource, error) {
	createdResource, err := resource.NewGroupResource(
		group.Name,
		groupResourceType,
		group.Name,
		[]resource.GroupTraitOption{},
		resource.WithResourceProfile(
			map[string]interface{}{
				"group_name": group.Name,
				"group_type": group.Type,
			},
		),
	)
	if err != nil {
		return nil, err
	}

	return createdResource, nil
}
