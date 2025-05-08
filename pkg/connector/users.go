package connector

import (
	"context"
	"fmt"

	"github.com/conductorone/baton-confluence-datacenter/pkg/connector/client"
	v2 "github.com/conductorone/baton-sdk/pb/c1/connector/v2"
	"github.com/conductorone/baton-sdk/pkg/annotations"
	"github.com/conductorone/baton-sdk/pkg/connectorbuilder"
	"github.com/conductorone/baton-sdk/pkg/pagination"
	"github.com/conductorone/baton-sdk/pkg/types/grant"
	"github.com/conductorone/baton-sdk/pkg/types/resource"
	"github.com/grpc-ecosystem/go-grpc-middleware/logging/zap/ctxzap"
	"go.uber.org/zap"
)

func annotationsForUserResourceType() annotations.Annotations {
	annos := annotations.Annotations{}
	return annos
}

type userBuilder struct {
	confluenceService client.ConfluenceService
}

func (o *userBuilder) ResourceType(ctx context.Context) *v2.ResourceType {
	return userResourceType
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
	users, nextToken, rateLimitData, err := o.confluenceService.GetUsers(ctx, pToken.Token)
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
	ctx context.Context,
	resource *v2.Resource,
	_ *pagination.Token,
) ([]*v2.Entitlement, string, annotations.Annotations, error) {
	return nil, "", nil, nil
}

// Grants returns a user's group memberships by querying the "/rest/api/user/memberof?key={{userKey}}" endpoint.
//
// The implementation uses the user endpoint instead of "/rest/api/group/{{groupName}}/member"
// because the latter doesn't support group names containing forward slashes ('/'). This approach:
//   - Avoids additional API calls for membership checks
//   - Eliminates group-user relationship caching
//   - Supports all group name formats, including those with slashes
func (o *userBuilder) Grants(
	ctx context.Context,
	resource *v2.Resource,
	pToken *pagination.Token,
) ([]*v2.Grant, string, annotations.Annotations, error) {
	groups, nextPage, ratelimitData, err := o.confluenceService.GetGroupsByUserKey(ctx, pToken.Token, resource.Id.Resource)
	outputAnnotations := WithRateLimitAnnotations(ratelimitData)
	if err != nil {
		return nil, "", outputAnnotations, err
	}

	var rv []*v2.Grant
	for _, group := range groups {
		groupResource := &v2.Resource{
			Id: &v2.ResourceId{
				ResourceType: groupResourceType.Id,
				Resource:     group.Name,
			},
		}

		rv = append(rv, grant.NewGrant(
			groupResource,
			groupMemberEntitlement,
			resource,
		))
	}

	return rv, nextPage, outputAnnotations, nil
}

func (o *userBuilder) CreateAccount(
	ctx context.Context,
	accountInfo *v2.AccountInfo,
	_ *v2.CredentialOptions,
) (connectorbuilder.CreateAccountResponse, []*v2.PlaintextData, annotations.Annotations, error) {
	profile := accountInfo.Profile.AsMap()

	username, _ := profile["username"].(string)
	fullname, _ := profile["fullname"].(string)
	email, _ := profile["email"].(string)
	password, _ := profile["password"].(string)

	userkey, rt, err := o.confluenceService.CreateUser(ctx, username, email, fullname, password)
	if err != nil {
		return nil, nil, nil, err
	}

	outputAnnotations := annotations.New()
	outputAnnotations.WithRateLimiting(rt)

	user, err := o.confluenceService.GetUserByKey(ctx, userkey)
	if err != nil {
		return nil, nil, nil, fmt.Errorf("creation of user '%s' failed, error: %w", username, err)
	}

	rsc, err := userResource(ctx, user)
	if err != nil {
		return nil, nil, nil, err
	}

	return &v2.CreateAccountResponse_SuccessResult{
		Resource: rsc,
	}, nil, outputAnnotations, nil
}

func (o *userBuilder) CreateAccountCapabilityDetails(_ context.Context) (*v2.CredentialDetailsAccountProvisioning, annotations.Annotations, error) {
	return &v2.CredentialDetailsAccountProvisioning{
		SupportedCredentialOptions: []v2.CapabilityDetailCredentialOption{
			v2.CapabilityDetailCredentialOption_CAPABILITY_DETAIL_CREDENTIAL_OPTION_NO_PASSWORD,
		},
		PreferredCredentialOption: v2.CapabilityDetailCredentialOption_CAPABILITY_DETAIL_CREDENTIAL_OPTION_NO_PASSWORD,
	}, nil, nil
}

func newUserBuilder(cclient client.ConfluenceClient) *userBuilder {
	return &userBuilder{
		confluenceService: client.NewConfluenceService(cclient),
	}
}

// userResource Converts a ConfluenceUser into a ConductorOne Resource.
func userResource(_ context.Context, user *client.ConfluenceUser) (*v2.Resource, error) {
	createdResource, err := resource.NewUserResource(
		user.DisplayName,
		userResourceType,
		user.UserKey,
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
