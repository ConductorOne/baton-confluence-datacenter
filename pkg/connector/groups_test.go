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

// Helper function to create a test builder with mocks
func newTestGroupBuilder(disableSlashSupportConfig bool) (*groupBuilder, *client.MockConfluenceService) {
	mockClient := client.ConfluenceClient{}
	mockClientService := &client.MockConfluenceService{}

	builder := newGroupBuilder(mockClient, disableSlashSupportConfig)
	// Replace the service with our mock
	builder.confluenceService = mockClientService

	return builder, mockClientService
}

func TestGroupsList(t *testing.T) {
	ctx := context.Background()

	t.Run("should get ratelimit annotations", func(t *testing.T) {
		// Create a new user builder with a mock client service
		groupBuilder, mockService := newTestGroupBuilder(false)

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
		// Create a new user builder with a mock client service
		groupBuilder, mockService := newTestGroupBuilder(false)

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
		// Create a new user builder with a mock client service
		groupBuilder, mockService := newTestGroupBuilder(false)

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

	// Test 1.1 - List: Not set slashInGroupNameDetected to true when group with slash is found and disableSlashSupportConfig is true
	t.Run("should not set slashInGroupNameDetected to true when group with slash is found and disableSlashSupportConfig is true", func(t *testing.T) {
		// Replace the service with our mock
		groupBuilder, mockClientService := newTestGroupBuilder(true)

		// Mock the GetGroups call to return a group with a slash
		mockClientService.GetGroupsFunc = func(ctx context.Context, pageToken string) ([]client.ConfluenceGroup, string, *v2.RateLimitDescription, error) {
			groups := []client.ConfluenceGroup{
				{
					Name: "team/engineering",
					Type: "group",
				},
			}
			return groups, "", nil, nil
		}

		resources, _, _, err := groupBuilder.List(ctx, nil, &pagination.Token{})
		require.NoError(t, err)
		require.False(t, groupBuilder.slashInGroupNameDetected)
		require.Len(t, resources, 1)
		require.Equal(t, "team/engineering", resources[0].DisplayName)
	})

	// Test 1.2 - List: Set slashInGroupNameDetected to true when group with slash is found and disableSlashSupportConfig is false
	t.Run("should set slashInGroupNameDetected to true when group with slash is found and disableSlashSupportConfig is false", func(t *testing.T) {
		// Replace the service with our mock
		groupBuilder, mockService := newTestGroupBuilder(false)

		// Mock the GetGroups call to return a group with a slash
		mockService.GetGroupsFunc = func(ctx context.Context, pageToken string) ([]client.ConfluenceGroup, string, *v2.RateLimitDescription, error) {
			groups := []client.ConfluenceGroup{
				{
					Name: "team/engineering",
					Type: "group",
				},
			}
			return groups, "", nil, nil
		}

		resources, _, _, err := groupBuilder.List(ctx, nil, &pagination.Token{})

		require.NoError(t, err)
		require.True(t, groupBuilder.slashInGroupNameDetected)
		require.Len(t, resources, 1)
		require.Equal(t, "team/engineering", resources[0].DisplayName)
	})

	// Test 1.3 - List: Do not set slashInGroupNameDetected to true if there are no groups with slashes and disableSlashSupportConfig is false
	t.Run("should not set slashInGroupNameDetected to true if there are no groups with slashes and disableSlashSupportConfig is false", func(t *testing.T) {
		// Replace the service with our mock
		groupBuilder, mockService := newTestGroupBuilder(false)

		// Mock the GetGroups call to return a group with a slash
		mockService.GetGroupsFunc = func(ctx context.Context, pageToken string) ([]client.ConfluenceGroup, string, *v2.RateLimitDescription, error) {
			groups := []client.ConfluenceGroup{
				{
					Name: "team",
					Type: "group",
				},
			}
			return groups, "", nil, nil
		}

		resources, _, _, err := groupBuilder.List(ctx, nil, &pagination.Token{})

		require.NoError(t, err)
		require.False(t, groupBuilder.slashInGroupNameDetected)
		require.Len(t, resources, 1)
		require.Equal(t, "team", resources[0].DisplayName)
	})

	// Test 2.1 - Grants: Not use cache if disableSlashSupportConfig is true
	t.Run("should not use cache if disableSlashSupportConfig is true", func(t *testing.T) {
		// Replace the service with our mock
		groupBuilder, mockService := newTestGroupBuilder(true)
		groupBuilder.slashInGroupNameDetected = true // Set to true to test that it is not used

		mockService.GetGroupsFunc = func(ctx context.Context, pageToken string) ([]client.ConfluenceGroup, string, *v2.RateLimitDescription, error) {
			groups := []client.ConfluenceGroup{
				{
					Name: "team",
					Type: "group",
				},
			}
			return groups, "", nil, nil
		}

		resources, _, _, err := groupBuilder.List(ctx, nil, &pagination.Token{})

		require.NoError(t, err)
		require.Len(t, resources, 1)
		require.Equal(t, "team", resources[0].DisplayName)
	})

	// Test 2.2 - Grants: Not use cache if there are no groups with slashes and disableSlashSupportConfig is false
	t.Run("should not use cache if there are no groups with slashes and disableSlashSupportConfig is false", func(t *testing.T) {
		// Replace the service with our mock
		groupBuilder, mockService := newTestGroupBuilder(false)

		mockService.GetGroupMembersFunc = func(ctx context.Context, pageToken, groupName string) ([]client.ConfluenceUser, string, *v2.RateLimitDescription, error) {
			users := []client.ConfluenceUser{
				{
					Username:    "user1",
					UserKey:     "key1",
					DisplayName: "User One",
				},
			}
			return users, "", nil, nil
		}

		grants, _, _, err := groupBuilder.Grants(ctx, &v2.Resource{
			Id: &v2.ResourceId{
				Resource: "team",
			},
			DisplayName: "team",
		}, &pagination.Token{})

		require.NoError(t, err)
		require.Len(t, grants, 1)
		require.Equal(t, "key1", grants[0].Principal.Id.Resource)
		require.Equal(t, "team", grants[0].Entitlement.Resource.DisplayName)
	})

	// Test 2.3 - Grants: Use cache if there are groups with slashes and disableSlashSupportConfig is false
	t.Run("should use cache if there are groups with slashes and disableSlashSupportConfig is false", func(t *testing.T) {
		// Replace the service with our mock
		groupBuilder, mockService := newTestGroupBuilder(false)
		groupBuilder.slashInGroupNameDetected = true // Set to true to test that it is used

		// Mock GetUsers to return test users
		mockService.GetUsersFunc = func(ctx context.Context, pageToken string) ([]client.ConfluenceUser, string, *v2.RateLimitDescription, error) {
			users := []client.ConfluenceUser{
				{
					Username:    "user1",
					UserKey:     "key1",
					DisplayName: "User One",
				},
			}
			return users, "", nil, nil
		}

		// Mock GetGroupsByUserKey to return groups for the user
		mockService.GetGroupsByUserKeyFunc = func(
			ctx context.Context,
			pageToken,
			userKey string,
		) (
			[]client.ConfluenceGroup,
			string,
			*v2.RateLimitDescription,
			error,
		) {
			groups := []client.ConfluenceGroup{
				{
					Name: "team/engineering",
					Type: "group",
				},
			}
			return groups, "", nil, nil
		}

		grants, _, _, err := groupBuilder.Grants(ctx, &v2.Resource{
			Id: &v2.ResourceId{
				Resource: "team/engineering",
			},
			DisplayName: "team/engineering",
		}, &pagination.Token{})

		require.NoError(t, err)
		require.Len(t, grants, 1)
		require.Equal(t, "key1", grants[0].Principal.Id.Resource)
		require.Equal(t, "team/engineering", grants[0].Entitlement.Resource.DisplayName)
	})

	// Test 3.1 - Grant: Reject grant operation for group with slash
	t.Run("should reject grant operation for group with slash", func(t *testing.T) {
		// Replace the service with our mock
		groupBuilder, _ := newTestGroupBuilder(false)

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

	// Test 3.2 - Grant: Reject grant operation for user with slash
	t.Run("should reject grant operation for user with slash", func(t *testing.T) {
		// Replace the service with our mock
		groupBuilder, mockService := newTestGroupBuilder(false)

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

	// Test 4.1 - Revoke: Reject revoke operation for group with slash
	t.Run("should reject revoke operation for group with slash", func(t *testing.T) {
		// Replace the service with our mock
		groupBuilder, _ := newTestGroupBuilder(false)

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

	// Test 4.2 - Revoke: Reject revoke operation for user with slash
	t.Run("should reject revoke operation for user with slash", func(t *testing.T) {
		// Replace the service with our mock
		groupBuilder, mockService := newTestGroupBuilder(false)

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

	// Test 4.1 - Cache: Ensure buildGroupMembershipCache constructs a complete group-to-members map by iterating over all users.
	// Also verifies that the cache-building logic correctly handles and retries on rate limit errors.
	t.Run("should handle rate limit errors while building group cache", func(t *testing.T) {
		// Replace the service with our mock
		groupBuilder, mockService := newTestGroupBuilder(false)
		groupBuilder.slashInGroupNameDetected = true // Set to true to test that it is used

		// Track number of calls to GetUsers and GetGroupsByUserKey to verify retry behavior
		callCountGetUsers := 0
		callCountGetGroupsByUserKey := 0

		// Mock GetUsers to return rate limit error first, then succeed
		mockService.GetUsersFunc = func(ctx context.Context, pageToken string) ([]client.ConfluenceUser, string, *v2.RateLimitDescription, error) {
			callCountGetUsers++

			if callCountGetUsers == 1 {
				// First call returns rate limit error
				rateLimitData := v2.RateLimitDescription{
					Status:  v2.RateLimitDescription_STATUS_OVERLIMIT,
					ResetAt: timestamppb.New(time.Now().Add(2 * time.Second)),
				}
				return nil, "", &rateLimitData, fmt.Errorf("rate limit error")
			}

			// Subsequent call succeeds
			users := []client.ConfluenceUser{
				{
					Username:    "user1",
					UserKey:     "key1",
					DisplayName: "User One",
				},
			}
			return users, "", nil, nil
		}

		// Mock GetGroupsByUserKey to return rate limit error first, then succeed
		mockService.GetGroupsByUserKeyFunc = func(
			ctx context.Context,
			pageToken,
			userKey string,
		) (
			[]client.ConfluenceGroup,
			string,
			*v2.RateLimitDescription,
			error,
		) {
			callCountGetGroupsByUserKey++

			if callCountGetGroupsByUserKey == 1 {
				rateLimitData := v2.RateLimitDescription{
					Status:  v2.RateLimitDescription_STATUS_OVERLIMIT,
					ResetAt: timestamppb.New(time.Now().Add(2 * time.Second)),
				}
				return nil, "", &rateLimitData, fmt.Errorf("rate limit error")
			}

			groups := []client.ConfluenceGroup{
				{
					Name: "team/engineering",
					Type: "group",
				},
			}
			return groups, "", nil, nil
		}

		// Test successful retry after rate limit
		cache, err := groupBuilder.buildGroupMembershipCache(ctx)

		// Verify the cache was built correctly after retry
		require.NoError(t, err)
		require.Len(t, cache, 1)
		require.Contains(t, cache, "team/engineering")
		require.Len(t, cache["team/engineering"], 1)
		require.Equal(t, "key1", cache["team/engineering"][0].UserKey)

		// Verify the number of calls matches our expectation (1 failed + 1 successful)
		require.Equal(t, 2, callCountGetUsers, "Expected exactly 2 calls to GetUsers")
		require.Equal(t, 2, callCountGetGroupsByUserKey, "Expected exactly 2 calls to GetGroupsByUserKey")
	})
}
