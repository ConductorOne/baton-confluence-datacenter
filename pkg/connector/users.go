package connector

import (
	"context"

	"github.com/conductorone/baton-confluence-datacenter/pkg/connector/client"
	v2 "github.com/conductorone/baton-sdk/pb/c1/connector/v2"
	"github.com/conductorone/baton-sdk/pkg/annotations"
	"github.com/conductorone/baton-sdk/pkg/pagination"
	"github.com/conductorone/baton-sdk/pkg/types/resource"
	"github.com/grpc-ecosystem/go-grpc-middleware/logging/zap/ctxzap"
	"go.uber.org/zap"
)

func annotationsForUserResourceType() annotations.Annotations {
	annos := annotations.Annotations{}
	annos.Update(&v2.SkipEntitlementsAndGrants{})
	return annos
}

type userBuilder struct {
	client client.ConfluenceClient
}

func (o *userBuilder) ResourceType(ctx context.Context) *v2.ResourceType {
	return userResourceType
}

// MakeGetUsersCall is a hook for mocking the client in tests.
var MakeGetUsersCall = func(
	ctx context.Context,
	client client.ConfluenceClient,
	pageToken string,
) (
	[]client.ConfluenceUser,
	string,
	*v2.RateLimitDescription,
	error,
) {
	return client.GetUsers(ctx, pageToken)
}

// List returns all the users from the database as resource objects.
// Users include a UserTrait because they are the 'shape' of a standard user.
func (o *userBuilder) List(
	ctx context.Context,
	parentResourceID *v2.ResourceId,
	pToken *pagination.Token,
) ([]*v2.Resource, string, annotations.Annotations, error) {
	logger := ctxzap.Extract(ctx)
	logger.Debug(
		"Starting call to Users.List",
		zap.String("pToken", pToken.Token),
	)
	users, nextToken, rateLimitData, err := MakeGetUsersCall(ctx, o.client, pToken.Token)
	outputAnnotations := WithRateLimitAnnotations(rateLimitData)
	if err != nil {
		return nil, "", outputAnnotations, err
	}
	rv := make([]*v2.Resource, 0)
	for _, user := range users {
		userCopy := user
		ur, err := userResource(ctx, &userCopy)
		if err != nil {
			return nil, "", nil, err
		}

		rv = append(rv, ur)
	}

	return rv, nextToken, outputAnnotations, nil
}

// Entitlements always returns an empty slice for users.
func (o *userBuilder) Entitlements(
	_ context.Context,
	resource *v2.Resource,
	_ *pagination.Token,
) ([]*v2.Entitlement, string, annotations.Annotations, error) {
	return nil, "", nil, nil
}

// Grants always returns an empty slice for users since they don't have any entitlements.
func (o *userBuilder) Grants(
	ctx context.Context,
	resource *v2.Resource,
	pToken *pagination.Token,
) ([]*v2.Grant, string, annotations.Annotations, error) {
	return nil, "", nil, nil
}

func newUserBuilder(client client.ConfluenceClient) *userBuilder {
	return &userBuilder{
		client: client,
	}
}

// userResource Converts a ConfluenceUser into a ConductorOne Resource.
func userResource(ctx context.Context, user *client.ConfluenceUser) (*v2.Resource, error) {
	createdResource, err := resource.NewUserResource(
		user.DisplayName,
		userResourceType,
		user.Username,
		[]resource.UserTraitOption{
			resource.WithUserProfile(
				map[string]interface{}{
					"user_name":    user.Username,
					"account_type": user.Type,
					"id":           user.UserKey,
				},
			),
			resource.WithStatus(v2.UserTrait_Status_STATUS_ENABLED),
		},
	)
	if err != nil {
		return nil, err
	}

	return createdResource, nil
}

func WithRateLimitAnnotations(
	ratelimitDescriptionAnnotations ...*v2.RateLimitDescription,
) annotations.Annotations {
	outputAnnotations := annotations.Annotations{}
	for _, annotation := range ratelimitDescriptionAnnotations {
		outputAnnotations.Append(annotation)
	}

	return outputAnnotations
}
