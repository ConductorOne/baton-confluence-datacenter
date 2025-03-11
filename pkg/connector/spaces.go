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
	"strings"
)

type spaceBuilder struct {
	client                client.ConfluenceClient
	SpacePermissionsCache []client.ConfluenceSpacePermission
}

func (o *spaceBuilder) ResourceType(_ context.Context) *v2.ResourceType {
	return spaceResourceType
}

// List returns all the spaces from the database as resource objects.
func (o *spaceBuilder) List(
	ctx context.Context,
	_ *v2.ResourceId,
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
	var entitlements []*v2.Entitlement

	if len(o.SpacePermissionsCache) == 0 {
		permissionsList, _, err := o.client.GetSpacePermissions(
			ctx,
			resource.Id.Resource,
		)
		if err != nil {
			return nil, "", nil, err
		}

		o.SpacePermissionsCache = permissionsList
	}

	for _, permission := range o.SpacePermissionsCache {
		operation := permission.Operation

		newEntitlement := entitlement.NewPermissionEntitlement(
			resource,
			operation.OperationKey+"-"+operation.TargetType,
			entitlement.WithGrantableTo(userResourceType),
			entitlement.WithGrantableTo(groupResourceType),
			entitlement.WithDisplayName(
				fmt.Sprintf(
					"Can %s %s",
					operation.OperationKey,
					resource.DisplayName,
				),
			),
			entitlement.WithDescription(
				fmt.Sprintf(
					"Has permission to %s the %s space in Confluence Data Center",
					operation.OperationKey,
					resource.DisplayName,
				),
			),
		)

		entitlements = append(entitlements, newEntitlement)
	}

	return entitlements, "", nil, nil
}

// Grants the grants for a given space are the permissions.
func (o *spaceBuilder) Grants(
	_ context.Context,
	resource *v2.Resource,
	_ *pagination.Token,
) (
	[]*v2.Grant,
	string,
	annotations.Annotations,
	error,
) {
	if len(o.SpacePermissionsCache) == 0 {
		return nil, "", nil, fmt.Errorf("no data of space permissions found. Space permissions cache is empty")
	}

	var grants []*v2.Grant
	for _, permission := range o.SpacePermissionsCache {
		operation := permission.Operation
		subject := permission.Subject

		var resourceType, resourceId string
		switch subject.Type {
		case "user":
			resourceType = userResourceType.Id
			resourceId = subject.UserKey // for users, the user key is used since it's the userResource ID
		case "group":
			resourceType = groupResourceType.Id
			resourceId = subject.Name // for groups, the name is used since it's the groupResource ID
		default:
			continue
		}

		newGrant := grant.NewGrant(
			resource,
			operation.OperationKey+"-"+operation.TargetType,
			&v2.ResourceId{
				ResourceType: resourceType,
				Resource:     resourceId,
			},
		)
		grants = append(grants, newGrant)
	}

	return grants, "", nil, nil
}

func (o *spaceBuilder) Grant(
	ctx context.Context,
	principal *v2.Resource,
	entitlement *v2.Entitlement,
) (annotations.Annotations, error) {
	entitlementSegments := strings.Split(entitlement.Id, ":")
	if len(entitlementSegments) == 0 {
		return nil, fmt.Errorf("wrong format on the entitlement id: %s", entitlement.Id)
	}

	operationData := strings.Split(entitlementSegments[len(entitlementSegments)-1], "-")
	if len(operationData) != 2 {
		return nil, fmt.Errorf("wrong format on the entitlement id: %s", entitlement.Id)
	}

	operation := client.PermissionOperation{
		OperationKey: operationData[0],
		TargetType:   operationData[1],
	}
	var userKey, groupName string
	if principal.Id.ResourceType == userResourceType.Id {
		userKey = principal.Id.Resource
	} else if principal.Id.ResourceType == groupResourceType.Id {
		groupName = principal.Id.Resource
	}

	spaceKey, err := extractSpaceKeyFromEntitlement(entitlement.Resource.Id.Resource)
	if err != nil {
		return nil, err
	}

	ratelimitData, err := o.client.AddSpacePermission(
		ctx,
		operation,
		spaceKey,
		userKey,
		groupName,
	)

	outputAnnotations := WithRateLimitAnnotations(ratelimitData)
	return outputAnnotations, err
}

func extractSpaceKeyFromEntitlement(entitlementID string) (string, error) {
	entitlementSegments := strings.Split(entitlementID, ":")
	if len(entitlementSegments) < 2 || entitlementSegments[0] != "space" {
		return "", fmt.Errorf("couldn't extract the space key from the entitlement %s", entitlementID)
	}

	return entitlementSegments[1], nil
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

func spaceResource(_ context.Context, space *client.ConfluenceSpace) (*v2.Resource, error) {
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
