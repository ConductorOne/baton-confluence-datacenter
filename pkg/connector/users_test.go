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
func newTestUserBuilder() (*userBuilder, *client.MockConfluenceService) {
	mockClient := client.ConfluenceClient{}
	mockClientService := &client.MockConfluenceService{}

	builder := newUserBuilder(mockClient)
	// Replace the service with our mock
	builder.confluenceService = mockClientService

	return builder, mockClientService
}

func TestUsersList(t *testing.T) {
	ctx := context.Background()

	t.Run("should get ratelimit annotations", func(t *testing.T) {
		// Create a new user builder with a mock client service
		userBuilder, mockClientService := newTestUserBuilder()

		mockClientService.GetUsersFunc = func(
			ctx context.Context,
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
		// Create a new user builder with a mock client service
		userBuilder, mockClientService := newTestUserBuilder()

		startToken := "1234"
		mockClientService.GetUsersFunc = func(
			ctx context.Context,
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

		_, _, _, _ = userBuilder.List(ctx, nil, &pagination.Token{Token: startToken})
	})

	t.Run("should get users", func(t *testing.T) {
		// Create a new user builder with a mock client service
		userBuilder, mockClientService := newTestUserBuilder()

		mockClientService.GetUsersFunc = func(
			ctx context.Context,
			pageToken string,
		) (
			[]client.ConfluenceUser,
			string,
			*v2.RateLimitDescription,
			error,
		) {
			users := []client.ConfluenceUser{
				{
					DisplayName: "marcos",
					UserKey:     "1",
				},
			}
			return users, "", nil, nil
		}

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
