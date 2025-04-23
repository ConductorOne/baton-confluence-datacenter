package connector

import (
	"context"
	"fmt"
	"testing"
	"time"

	"github.com/conductorone/baton-confluence-datacenter/pkg/connector/client"
	v2 "github.com/conductorone/baton-sdk/pb/c1/connector/v2"
	"github.com/conductorone/baton-sdk/pkg/pagination"
	"github.com/stretchr/testify/require"
	"google.golang.org/protobuf/types/known/timestamppb"
)

// Helper function to create a test builder with mocks.
func newTestGroupBuilder() (*groupBuilder, *client.MockConfluenceService) {
	mockClient := client.ConfluenceClient{}
	mockClientService := &client.MockConfluenceService{}

	builder := newGroupBuilder(mockClient)
	// Replace the service with our mock.
	builder.confluenceService = mockClientService

	return builder, mockClientService
}

func TestGroupsList(t *testing.T) {
	ctx := context.Background()

	t.Run("should get ratelimit annotations", func(t *testing.T) {
		// Create a new user builder with a mock client service.
		groupBuilder, mockService := newTestGroupBuilder()

		mockService.GetGroupsFunc = func(
			ctx context.Context,
			pageToken string,
		) (
			[]client.ConfluenceGroup,
			string,
			*v2.RateLimitDescription,
			error,
		) {
			rateLimitData := v2.RateLimitDescription{
				ResetAt: timestamppb.New(time.Now().Add(10 * time.Second)),
			}
			err := fmt.Errorf("ratelimit error")
			return nil, "", &rateLimitData, err
		}

		resources, token, annotations, err := groupBuilder.List(ctx, nil, &pagination.Token{})

		require.Nil(t, resources)
		require.Empty(t, token)
		require.NotNil(t, err)

		// There should be annotations.
		require.Len(t, annotations, 1)
		rateLimitData := v2.RateLimitDescription{}
		err = annotations[0].UnmarshalTo(&rateLimitData)
		if err != nil {
			t.Errorf("couldn't unmarshal the ratelimit annotation")
		}
		require.NotNil(t, rateLimitData.ResetAt)
	})

	t.Run("should get passed a pagination token", func(t *testing.T) {
		// Create a new user builder with a mock client service.
		groupBuilder, mockService := newTestGroupBuilder()

		startToken := "1234"
		mockService.GetGroupsFunc = func(
			ctx context.Context,
			pageToken string,
		) (
			[]client.ConfluenceGroup,
			string,
			*v2.RateLimitDescription,
			error,
		) {
			require.Equal(t, startToken, pageToken)
			return nil, "", nil, nil
		}

		_, _, _, _ = groupBuilder.List(ctx, nil, &pagination.Token{Token: startToken})
	})

	t.Run("should get users", func(t *testing.T) {
		// Create a new user builder with a mock client service.
		groupBuilder, mockService := newTestGroupBuilder()

		mockService.GetGroupsFunc = func(ctx context.Context, pageToken string) ([]client.ConfluenceGroup, string, *v2.RateLimitDescription, error) {
			groups := []client.ConfluenceGroup{
				{
					Name: "group1",
					Type: "group",
				},
			}
			return groups, "", nil, nil
		}

		resources, token, annotations, err := groupBuilder.List(ctx, nil, &pagination.Token{})

		// Assert the returned user has an ID.
		require.NotNil(t, resources)
		require.Len(t, resources, 1)
		require.NotEmpty(t, resources[0].Id)

		require.NotNil(t, token)
		AssertNoRatelimitAnnotations(t, annotations)
		require.Nil(t, err)
	})
}

// TestGroupsWithSlashes tests the groups with slashes functionality.
func TestGroupsWithSlashes(t *testing.T) {
	ctx := context.Background()

	// Test 1.1 - Grant: Reject grant operation for group with slash.
	t.Run("should reject grant operation for group with slash", func(t *testing.T) {
		// Replace the service with our mock.
		groupBuilder, _ := newTestGroupBuilder()

		_, err := groupBuilder.Grant(ctx, &v2.Resource{
			Id: &v2.ResourceId{
				ResourceType: userResourceType.Id,
				Resource:     "user1",
			},
		}, &v2.Entitlement{
			Resource: &v2.Resource{
				Id: &v2.ResourceId{
					Resource: "team/engineering",
				},
			},
		})

		require.Error(t, err)
		require.Contains(t, err.Error(), "groups containing '/' in their name are not supported for grant operations")
	})

	// Test 1.2 - Grant: Reject grant operation for user with slash.
	t.Run("should reject grant operation for user with slash", func(t *testing.T) {
		// Replace the service with our mock
		groupBuilder, mockService := newTestGroupBuilder()

		mockService.GetUserByKeyFunc = func(ctx context.Context, userKey string) (*client.ConfluenceUser, error) {
			user := &client.ConfluenceUser{
				Username:    "user1/engineering",
				UserKey:     "user1/engineering",
				DisplayName: "User One",
			}
			return user, nil
		}

		_, err := groupBuilder.Grant(ctx, &v2.Resource{
			Id: &v2.ResourceId{
				ResourceType: userResourceType.Id,
				Resource:     "user1/engineering",
			},
		}, &v2.Entitlement{
			Resource: &v2.Resource{
				Id: &v2.ResourceId{
					Resource: "team engineering",
				},
			},
		})

		require.Error(t, err)
		require.Contains(t, err.Error(), "users with '/' in their username are not supported for grant operations")
	})

	// Test 2.1 - Revoke: Reject revoke operation for group with slash.
	t.Run("should reject revoke operation for group with slash", func(t *testing.T) {
		// Replace the service with our mock
		groupBuilder, _ := newTestGroupBuilder()

		_, err := groupBuilder.Revoke(ctx, &v2.Grant{
			Principal: &v2.Resource{
				Id: &v2.ResourceId{
					ResourceType: userResourceType.Id,
					Resource:     "user1",
				},
			},
			Entitlement: &v2.Entitlement{
				Resource: &v2.Resource{
					Id: &v2.ResourceId{
						Resource: "team/engineering",
					},
				},
			},
		})

		require.Error(t, err)
		require.Contains(t, err.Error(), "groups with '/' in their name are not supported for revoke operations")
	})

	// Test 2.2 - Revoke: Reject revoke operation for user with slash.
	t.Run("should reject revoke operation for user with slash", func(t *testing.T) {
		// Replace the service with our mock
		groupBuilder, mockService := newTestGroupBuilder()

		mockService.GetUserByKeyFunc = func(ctx context.Context, userKey string) (*client.ConfluenceUser, error) {
			user := &client.ConfluenceUser{
				Username:    "user1/engineering",
				UserKey:     "user1/engineering",
				DisplayName: "User One",
			}
			return user, nil
		}

		_, err := groupBuilder.Revoke(ctx, &v2.Grant{
			Principal: &v2.Resource{
				Id: &v2.ResourceId{
					ResourceType: userResourceType.Id,
					Resource:     "user1/engineering",
				},
			},
			Entitlement: &v2.Entitlement{
				Resource: &v2.Resource{
					Id: &v2.ResourceId{
						Resource: "team engineering",
					},
				},
			},
		})

		require.Error(t, err)
		require.Contains(t, err.Error(), "users with '/' in their username are not supported for revoke operations")
	})
}
