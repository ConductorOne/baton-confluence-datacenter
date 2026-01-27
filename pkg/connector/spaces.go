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
	"github.com/conductorone/baton-sdk/pkg/types/grant"
	"github.com/conductorone/baton-sdk/pkg/types/resource"
)

type spaceBuilder struct {
	confluenceService client.ConfluenceService
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
	spaces, nextToken, ratelimitData, err := o.confluenceService.GetSpaces(ctx, pToken.Token)
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
	spaceKey := resource.Id.Resource

	permissionsList, rlData, err := o.confluenceService.GetSpacePermissions(
		ctx,
		spaceKey,
	)
	outputAnnotations := WithRateLimitAnnotations(rlData)
	if err != nil {
		return nil, "", outputAnnotations, err
	}

	for _, permission := range permissionsList {
		operation := permission.Operation

		newEntitlement := entitlement.NewPermissionEntitlement(
			resource,
			operation.OperationKey+"-"+operation.TargetType,
			entitlement.WithGrantableTo(userResourceType),
			entitlement.WithGrantableTo(groupResourceType),
			entitlement.WithDisplayName(
				fmt.Sprintf(
					"Can %s on '%s'",
					operation.OperationKey+" "+operation.TargetType,
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

	return entitlements, "", outputAnnotations, nil
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
	spaceKey := resource.Id.Resource
	permissionsList, rlData, err := o.confluenceService.GetSpacePermissions(
		ctx,
		spaceKey,
	)
	outputAnnotations := WithRateLimitAnnotations(rlData)
	if err != nil {
		return nil, "", outputAnnotations, err
	}

	var grants []*v2.Grant
	for _, permission := range permissionsList {
		if permission.SpaceKey != resource.Id.Resource {
			continue
		}

		operation := permission.Operation
		subject := permission.Subject

		var resourceType, resourceId string
		switch subject.Type {
		case client.PermissionTypeUser:
			resourceType = userResourceType.Id
			resourceId = subject.UserKey // for users, the user key is used since it's the userResource ID
		case client.PermissionTypeGroup:
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

	return grants, "", outputAnnotations, nil
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

	spaceKey, err := extractSpaceKeyFromEntitlement(entitlement.Id)
	if err != nil {
		return nil, err
	}

	permissionsList, rlData, err := o.confluenceService.GetSpacePermissions(
		ctx,
		spaceKey,
	)
	outputAnnotations := WithRateLimitAnnotations(rlData)
	if err != nil {
		return outputAnnotations, err
	}

	var userKey, groupName string
	switch principal.Id.ResourceType {
	case userResourceType.Id:
		userKey = principal.Id.Resource
	case groupResourceType.Id:
		groupName = principal.Id.Resource
	}

	var currentOperations []client.PermissionOperation
	for _, spacePermission := range permissionsList {
		if (userKey != "" && spacePermission.Subject.UserKey == userKey) || (groupName != "" && spacePermission.Subject.Name == groupName) {
			currentOperations = append(currentOperations, spacePermission.Operation)
		}
	}

	currentOperations = append(currentOperations,
		client.PermissionOperation{
			OperationKey: operationData[0],
			TargetType:   operationData[1],
		},
	)

	ratelimitData, err := o.confluenceService.UpdateSpacePermissions(
		ctx,
		currentOperations,
		spaceKey,
		userKey,
		groupName,
	)
	if err != nil {
		return nil, err
	}

	outputAnnotations = WithRateLimitAnnotations(ratelimitData)
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
	entitlementID := grant.Entitlement.Id
	principal := grant.Principal
	entitlementSegments := strings.Split(entitlementID, ":")
	if len(entitlementSegments) == 0 {
		return nil, fmt.Errorf("wrong format on the entitlement id: %s", entitlementID)
	}

	operationData := strings.Split(entitlementSegments[len(entitlementSegments)-1], "-")
	if len(operationData) != 2 {
		return nil, fmt.Errorf("wrong format on the entitlement id: %s", entitlementID)
	}

	spaceKey, err := extractSpaceKeyFromEntitlement(entitlementID)
	if err != nil {
		return nil, err
	}

	permissionsList, rlData, err := o.confluenceService.GetSpacePermissions(
		ctx,
		spaceKey,
	)
	outputAnnotations := WithRateLimitAnnotations(rlData)
	if err != nil {
		return outputAnnotations, err
	}

	var userKey, groupName string
	switch principal.Id.ResourceType {
	case userResourceType.Id:
		userKey = principal.Id.Resource
	case groupResourceType.Id:
		groupName = principal.Id.Resource
	}

	var currentOperations []client.PermissionOperation
	for _, spacePermission := range permissionsList {
		if (userKey != "" && spacePermission.Subject.UserKey == userKey) || (groupName != "" && spacePermission.Subject.Name == groupName) {
			if spacePermission.Operation.OperationKey == operationData[0] && spacePermission.Operation.TargetType == operationData[1] {
				continue
			}
			currentOperations = append(currentOperations, spacePermission.Operation)
		}
	}

	ratelimitData, err := o.confluenceService.UpdateSpacePermissions(
		ctx,
		currentOperations,
		spaceKey,
		userKey,
		groupName,
	)
	if err != nil {
		return nil, err
	}

	outputAnnotations = WithRateLimitAnnotations(ratelimitData)
	return outputAnnotations, nil
}

func newSpaceBuilder(c client.ConfluenceClient) *spaceBuilder {
	return &spaceBuilder{
		confluenceService: client.NewConfluenceService(c),
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
