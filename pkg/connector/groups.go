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
)

const (
	groupMemberEntitlement = "member"
)

type groupBuilder struct {
	client client.ConfluenceClient
}

func (o *groupBuilder) ResourceType(ctx context.Context) *v2.ResourceType {
	return groupResourceType
}

// List returns all the groups from the database as resource objects.
// Groups include a GroupTrait because they are the 'shape' of a standard group.
func (o *groupBuilder) List(
	ctx context.Context,
	parentResourceID *v2.ResourceId,
	pToken *pagination.Token,
) ([]*v2.Resource, string, annotations.Annotations, error) {
	groups, _, err := o.client.GetGroups(ctx, "", ResourcesPageSize)
	if err != nil {
		return nil, "", nil, err
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

	return rv, "", nil, nil
}

// Entitlements always returns an empty slice for groups.
func (o *groupBuilder) Entitlements(
	_ context.Context,
	resource *v2.Resource,
	_ *pagination.Token,
) ([]*v2.Entitlement, string, annotations.Annotations, error) {
	var entitlements []*v2.Entitlement

	assignmentOptions := []entitlement.EntitlementOption{
		entitlement.WithGrantableTo(userResourceType),
		entitlement.WithDisplayName(fmt.Sprintf("%s Group Member", resource.DisplayName)),
		entitlement.WithDescription(fmt.Sprintf("Is member of the %s group in Confluence", resource.DisplayName)),
	}

	entitlements = append(entitlements, entitlement.NewAssignmentEntitlement(
		resource,
		groupMemberEntitlement,
		assignmentOptions...,
	))

	return entitlements, "", nil, nil
}

// Grants always returns an empty slice for groups since they don't have any entitlements.
func (o *groupBuilder) Grants(
	ctx context.Context,
	resource *v2.Resource,
	pToken *pagination.Token,
) ([]*v2.Grant, string, annotations.Annotations, error) {
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

	users, token, err := o.client.GetGroupMembers(ctx, bag.PageToken(), ResourcesPageSize, resource.DisplayName)
	if err != nil {
		return nil, "", nil, err
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

	nextPage, err := bag.NextToken(token)
	if err != nil {
		return nil, "", nil, err
	}
	return groups, nextPage, nil, nil
}

func newGroupBuilder(client client.ConfluenceClient) *groupBuilder {
	return &groupBuilder{
		client: client,
	}
}

func groupResource(ctx context.Context, group *client.ConfluenceGroup) (*v2.Resource, error) {
	profile := map[string]interface{}{
		"group_id":   group.Id,
		"group_name": group.Name,
		"group_type": group.Type,
	}

	groupTraitOptions := []resource.GroupTraitOption{resource.WithGroupProfile(profile)}

	createdResource, err := resource.NewGroupResource(
		group.Name,
		groupResourceType,
		group.Id,
		groupTraitOptions,
	)
	if err != nil {
		return nil, err
	}

	return createdResource, nil
}
