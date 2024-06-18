package connector

import (
	"context"
	"fmt"
	"github.com/conductorone/baton-confluence-datacenter/pkg/connector/client"
	v2 "github.com/conductorone/baton-sdk/pb/c1/connector/v2"
	"github.com/stretchr/testify/require"
	"google.golang.org/protobuf/types/known/timestamppb"
	"testing"
	"time"
)

func TestUsersListGetsRateLimitAnnotations(t *testing.T) {
	ctx := context.Background()

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
		return nil,
			"",
			&v2.RateLimitDescription{
				ResetAt: timestamppb.New(time.Now().Add(10 * time.Second)),
			},
			fmt.Errorf("ratelimit error")
	}

	userBuilder := newUserBuilder(client.ConfluenceClient{})
	resources, token, annotations, err := userBuilder.List(ctx, nil, nil)

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
}

func TestUsersListGetsUsers(t *testing.T) {
	ctx := context.Background()

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
		return []client.ConfluenceUser{
				{
					DisplayName: "marcos",
					UserKey:     "1",
				},
			},
			"",
			nil,
			nil
	}

	userBuilder := newUserBuilder(client.ConfluenceClient{})
	resources, token, annotations, err := userBuilder.List(ctx, nil, nil)

	// Assert the returned user has an ID.
	require.NotNil(t, resources)
	require.Len(t, resources, 1)
	require.NotEmpty(t, resources[0].Id)

	require.NotNil(t, token)
	require.Nil(t, annotations)
	require.Nil(t, err)
}
