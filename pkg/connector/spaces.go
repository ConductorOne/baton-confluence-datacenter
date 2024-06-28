package connector

import (
	"context"
	"fmt"

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

type spaceBuilder struct {
	client client.ConfluenceClient
}

func (o *spaceBuilder) ResourceType(ctx context.Context) *v2.ResourceType {
	return spaceResourceType
}

// List returns all the spaces from the database as resource objects.
func (o *spaceBuilder) List(
	ctx context.Context,
	parentResourceID *v2.ResourceId,
	pToken *pagination.Token,
) (
	[]*v2.Resource,
	string,
	annotations.Annotations,
	error,
) {
	spaces, nextToken, ratelimitData, err := o.client.GetSpaces(ctx, pToken.Token)
	outputAnnotations := WithRateLimitAnnotations(ratelimitData)
	if err != nil {
		return nil, "", outputAnnotations, err
	}
	rv := make([]*v2.Resource, 0)
	for _, space := range spaces {
		spaceCopy := space
		ur, err := spaceResource(ctx, &spaceCopy)
		if err != nil {
			return nil, "", nil, err
		}

		rv = append(rv, ur)
	}

	return rv, nextToken, outputAnnotations, nil
}

// Entitlements each space resource has _fourteen_ entitlements!
func (o *spaceBuilder) Entitlements(
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
		"Starting call to Spaces.Entitlements",
		zap.String("resource.DisplayName", resource.DisplayName),
		zap.String("resource.Id.Resource", resource.Id.Resource),
	)
	entitlements := make([]*v2.Entitlement, 0)
	for _, confluenceSpaceEntitlement := range o.client.ConfluenceSpaceEntitlements() {
		entitlements = append(
			entitlements,
			entitlement.NewPermissionEntitlement(
				resource,
				confluenceSpaceEntitlement.Name,
				entitlement.WithGrantableTo(userResourceType),
				entitlement.WithGrantableTo(groupResourceType),
				entitlement.WithDisplayName(
					fmt.Sprintf(
						"Can %s %s",
						confluenceSpaceEntitlement.DisplayName,
						resource.DisplayName,
					),
				),
				entitlement.WithDescription(
					fmt.Sprintf(
						"Has permission to %s the %s space in Confluence Data Center",
						confluenceSpaceEntitlement.DisplayName,
						resource.DisplayName,
					),
				),
			))
	}
	return entitlements, "", nil, nil
}

// Grants the grants for a given space are the permissions.
func (o *spaceBuilder) Grants(
	ctx context.Context,
	resource *v2.Resource,
	_ *pagination.Token,
) (
	[]*v2.Grant,
	string,
	annotations.Annotations,
	error,
) {
	permissionsList, ratelimitData, err := o.client.GetSpacePermissions(
		ctx,
		resource.Id.Resource,
	)
	outputAnnotations := WithRateLimitAnnotations(ratelimitData)
	if err != nil {
		return nil, "", outputAnnotations, err
	}

	var permissions []*v2.Grant
	for _, permissionsByType := range permissionsList {
		for _, permission := range permissionsByType.SpacePermissions {
			permissionType, ok := o.client.ConfluenceSpaceEntitlementByKey(permission.Type)
			if !ok {
				// Got an unknown permission type. This can happen because there
				// are some duplicate permission aliases.
				continue
			}

			var resourceType,
				resourceName string
			switch {
			case permission.UserName != "":
				resourceType = userResourceType.Id
				resourceName = permission.UserName
			case permission.GroupName != "":
				resourceType = groupResourceType.Id
				resourceName = permission.GroupName
			default:
				// User and group being null mean that there is anonymous access
				// and _everyone_ has this permission.
				// TODO(marcos): should we fetch _all_ users and give them each the grant?
				continue
			}

			permissions = append(
				permissions,
				grant.NewGrant(
					resource,
					permissionType.Name,
					&v2.ResourceId{
						ResourceType: resourceType,
						Resource:     resourceName,
					},
				))
		}
	}

	return permissions, "", outputAnnotations, nil
}

func (o *spaceBuilder) Grant(
	ctx context.Context,
	principal *v2.Resource,
	entitlement *v2.Entitlement,
) (annotations.Annotations, error) {
	entitlementEntry, ok := o.client.ConfluenceSpaceEntitlementByName(entitlement.Slug)
	if !ok {
		return nil, fmt.Errorf("no confluence space entitlement found for %s", entitlement.Slug)
	}

	ratelimitData, err := o.client.AddSpacePermission(
		ctx,
		entitlement.Resource.Id.Resource,
		principal.Id.Resource,
		entitlementEntry.Key,
	)
	outputAnnotations := WithRateLimitAnnotations(ratelimitData)
	return outputAnnotations, err
}

func (o *spaceBuilder) Revoke(
	ctx context.Context,
	grant *v2.Grant,
) (annotations.Annotations, error) {
	entitlementEntry, ok := o.client.ConfluenceSpaceEntitlementByName(grant.Entitlement.Slug)
	if !ok {
		return nil, fmt.Errorf("no confluence space entitlement found for %s", grant.Entitlement.Slug)
	}

	ratelimitData, err := o.client.RemoveSpacePermission(
		ctx,
		grant.Entitlement.Resource.Id.Resource,
		grant.Principal.Id.Resource,
		entitlementEntry.Key,
	)
	outputAnnotations := WithRateLimitAnnotations(ratelimitData)
	return outputAnnotations, err
}

func newSpaceBuilder(client client.ConfluenceClient) *spaceBuilder {
	return &spaceBuilder{
		client: client,
	}
}

func spaceResource(ctx context.Context, space *client.ConfluenceSpace) (*v2.Resource, error) {
	createdResource, err := resource.NewResource(
		space.Name,
		spaceResourceType,
		space.Key,
	)
	if err != nil {
		return nil, err
	}

	return createdResource, nil
}
