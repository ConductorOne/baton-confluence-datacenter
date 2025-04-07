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

func TestGroupsList(t *testing.T) {
	ctx := context.Background()

	userBuilder := newUserBuilder(client.ConfluenceClient{})

	t.Run("should get ratelimit annotations", func(t *testing.T) {
		MakeGetUsersCall = func(
			ctx context.Context,
			confluenceClient client.ConfluenceClient,
			pageToken string,
		) (
			[]client.ConfluenceUser,
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

		resources, token, annotations, err := userBuilder.List(ctx, nil, &pagination.Token{})

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
		startToken := "1234"
		MakeGetUsersCall = func(
			ctx context.Context,
			confluenceClient client.ConfluenceClient,
			pageToken string,
		) (
			[]client.ConfluenceUser,
			string,
			*v2.RateLimitDescription,
			error,
		) {
			require.Equal(t, startToken, pageToken)
			return nil, "", nil, nil
		}

		userBuilder := newUserBuilder(client.ConfluenceClient{})
		_, _, _, _ = userBuilder.List(ctx, nil, &pagination.Token{Token: startToken})
	})

	t.Run("should get users", func(t *testing.T) {
		MakeGetUsersCall = func(ctx context.Context, confluenceClient client.ConfluenceClient, pageToken string) ([]client.ConfluenceUser, string, *v2.RateLimitDescription, error) {
			users := []client.ConfluenceUser{
				{
					Username:    "user1",
					UserKey:     "key1",
					DisplayName: "User One",
				},
			}
			return users, "", nil, nil
		}

		userBuilder := newUserBuilder(client.ConfluenceClient{})
		resources, token, annotations, err := userBuilder.List(ctx, nil, &pagination.Token{})

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

	// Test 1.1 - List: Not set hasGroupWithSlash to true when group with slash is found and disableSlashSupportGroupName is true
	t.Run("should not set hasGroupWithSlash to true when group with slash is found and disableSlashSupportGroupName is true", func(t *testing.T) {
		// Reset the global state
		hasGroupWithSlash = false
		ResetGroupMembersCache()

		mockClient := client.ConfluenceClient{}
		groupBuilder := newGroupBuilder(mockClient, true)

		MakeGetGroupsCall = func(ctx context.Context, confluenceClient client.ConfluenceClient, pageToken string) ([]client.ConfluenceGroup, string, *v2.RateLimitDescription, error) {
			return []client.ConfluenceGroup{
				{
					Name: "team/engineering",
					Type: "group",
				},
			}, "", nil, nil
		}

		resources, _, _, err := groupBuilder.List(ctx, nil, &pagination.Token{})
		require.NoError(t, err)
		require.False(t, hasGroupWithSlash)
		require.Len(t, resources, 1)
		require.Equal(t, "team/engineering", resources[0].DisplayName)
	})

	// Test 1.2 - List: Set hasGroupWithSlash to true when group with slash is found and disableSlashSupportGroupName is false
	t.Run("should set hasGroupWithSlash to true when group with slash is found and disableSlashSupportGroupName is false", func(t *testing.T) {
		// Reset the global state
		hasGroupWithSlash = false
		ResetGroupMembersCache()

		mockClient := client.ConfluenceClient{}
		groupBuilder := newGroupBuilder(mockClient, false)

		// Mock the GetGroups call to return a group with a slash
		MakeGetGroupsCall = func(ctx context.Context, confluenceClient client.ConfluenceClient, pageToken string) ([]client.ConfluenceGroup, string, *v2.RateLimitDescription, error) {
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
		require.True(t, hasGroupWithSlash)
		require.Len(t, resources, 1)
		require.Equal(t, "team/engineering", resources[0].DisplayName)
	})

	// Test 1.3 - List: Do not set hasGroupWithSlash to true if there are no groups with slashes and disableSlashSupportGroupName is false
	t.Run("should not set hasGroupWithSlash to true if there are no groups with slashes and disableSlashSupportGroupName is false", func(t *testing.T) {
		// Reset the global state
		hasGroupWithSlash = false
		ResetGroupMembersCache()

		mockClient := client.ConfluenceClient{}
		groupBuilder := newGroupBuilder(mockClient, false)

		MakeGetGroupsCall = func(ctx context.Context, confluenceClient client.ConfluenceClient, pageToken string) ([]client.ConfluenceGroup, string, *v2.RateLimitDescription, error) {
			return []client.ConfluenceGroup{
				{
					Name: "team",
					Type: "group",
				},
			}, "", nil, nil
		}

		resources, _, _, err := groupBuilder.List(ctx, nil, &pagination.Token{})

		require.NoError(t, err)
		require.False(t, hasGroupWithSlash)
		require.Len(t, resources, 1)
		require.Equal(t, "team", resources[0].DisplayName)
	})

	// Test 2.1 - Grants: Not use cache if disableSlashSupportGroupName is true
	t.Run("should not use cache if disableSlashSupportGroupName is true", func(t *testing.T) {
		// Reset the global state
		hasGroupWithSlash = true // Set to true to test that it is not used
		ResetGroupMembersCache()

		mockClient := client.ConfluenceClient{}
		groupBuilder := newGroupBuilder(mockClient, true)

		MakeGetGroupsCall = func(ctx context.Context, confluenceClient client.ConfluenceClient, pageToken string) ([]client.ConfluenceGroup, string, *v2.RateLimitDescription, error) {
			return []client.ConfluenceGroup{
				{
					Name: "team",
					Type: "group",
				},
			}, "", nil, nil
		}

		resources, _, _, err := groupBuilder.List(ctx, nil, &pagination.Token{})

		require.NoError(t, err)
		require.Len(t, resources, 1)
		require.Equal(t, "team", resources[0].DisplayName)
	})

	// Test 2.2 - Grants: Not use cache if there are no groups with slashes and disableSlashSupportGroupName is false
	t.Run("should not use cache if there are no groups with slashes and disableSlashSupportGroupName is false", func(t *testing.T) {
		// Reset the global state
		hasGroupWithSlash = false
		ResetGroupMembersCache()

		mockClient := client.ConfluenceClient{}
		groupBuilder := newGroupBuilder(mockClient, false)

		MakeGetGroupMembersCall = func(ctx context.Context, confluenceClient client.ConfluenceClient, pageToken, groupName string) ([]client.ConfluenceUser, string, *v2.RateLimitDescription, error) {
			return []client.ConfluenceUser{
				{
					Username:    "user1",
					UserKey:     "key1",
					DisplayName: "User One",
				},
			}, "", nil, nil
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

	// Test 2.3 - Grants: Use cache if there are groups with slashes and disableSlashSupportGroupName is false
	t.Run("should use cache if there are groups with slashes and disableSlashSupportGroupName is false", func(t *testing.T) {
		// Reset the global state
		hasGroupWithSlash = true
		ResetGroupMembersCache()

		mockClient := client.ConfluenceClient{}
		groupBuilder := newGroupBuilder(mockClient, false)

		// Mock GetUsers to return test users
		MakeGetUsersCall = func(ctx context.Context, confluenceClient client.ConfluenceClient, pageToken string) ([]client.ConfluenceUser, string, *v2.RateLimitDescription, error) {
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
		MakeGetGroupsByUserKeyCall = func(
			ctx context.Context,
			confluenceClient client.ConfluenceClient,
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
		mockClient := client.ConfluenceClient{}
		groupBuilder := newGroupBuilder(mockClient, false)

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
		mockClient := client.ConfluenceClient{}
		groupBuilder := newGroupBuilder(mockClient, false)

		MakeGetUserByKeyCall = func(ctx context.Context, confluenceClient client.ConfluenceClient, userKey string) (*client.ConfluenceUser, error) {
			return &client.ConfluenceUser{
				Username:    "user1/engineering",
				UserKey:     "user1/engineering",
				DisplayName: "User One",
			}, nil
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
		mockClient := client.ConfluenceClient{}
		groupBuilder := newGroupBuilder(mockClient, false)

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
		mockClient := client.ConfluenceClient{}
		groupBuilder := newGroupBuilder(mockClient, false)

		MakeGetUserByKeyCall = func(ctx context.Context, confluenceClient client.ConfluenceClient, userKey string) (*client.ConfluenceUser, error) {
			return &client.ConfluenceUser{
				Username:    "user1/engineering",
				UserKey:     "user1/engineering",
				DisplayName: "User One",
			}, nil
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
