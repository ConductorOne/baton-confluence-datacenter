package client

import (
	"context"
	"fmt"
	"github.com/stretchr/testify/require"
	"net/http"
	"net/http/httptest"
	"testing"
	"time"
)

const (
	usersRateLimit = `{"message":"Rate limit exceeded."}`
	usersNoResults = `{
    "results": [],
    "start": 0,
    "limit": 0,
    "size": 0,
    "_links": {
        "self": "http://localhost:8090/rest/api/user/list/",
        "next": "/rest/api/user/list/?limit=0&start=0",
        "base": "http://localhost:8090",
        "context": ""
    }
}`
	usersListResults = `{
  "results": [
    {
      "type": "known",
      "username": "admin",
      "userKey": "2c95808390139223019013bdb7ec0000",
      "profilePicture": {
        "path": "/images/icons/profilepics/default.svg",
        "width": 48,
        "height": 48,
        "isDefault": true
      },
      "displayName": "admin",
      "_links": {
        "self": "http://localhost:8090/rest/api/user?key=2c95808390139223019013bdb7ec0000"
      },
      "_expandable": {
        "status": ""
      }
    }
  ],
  "start": 0,
  "limit": 100,
  "size": 1,
  "_links": {
    "self": "http://localhost:8090/rest/api/user/list/",
    "base": "http://localhost:8090",
    "context": ""
  }
}`
)

func TestIncToken(t *testing.T) {
	testCases := []struct {
		previousToken string
		count         int
		expected      string
	}{
		{"", 100, "100"},
		{"0", 100, "100"},
		{"1", 100, "101"},
		{"x", 100, "100"},
		{"", 0, ""},
		{"0", 0, ""},
		{"1", 0, ""},
		{"x", 0, ""},
	}
	for _, testCase := range testCases {
		t.Run(fmt.Sprint(testCase), func(t *testing.T) {
			nextToken := incToken(testCase.previousToken, testCase.count)
			require.Equal(t, testCase.expected, nextToken)
		})
	}
}

func TestGetUsersSetsRateLimitData(t *testing.T) {
	testCases := []struct {
		statusCode int
		success    bool
	}{
		{http.StatusOK, true},
		{http.StatusTooManyRequests, false},
		{http.StatusServiceUnavailable, false},
	}
	for _, testCase := range testCases {
		t.Run(fmt.Sprint(testCase), func(t *testing.T) {
			server := httptest.NewServer(
				http.HandlerFunc(
					func(writer http.ResponseWriter, request *http.Request) {
						var outputString string
						if testCase.statusCode == http.StatusOK {
							outputString = usersNoResults
						} else {
							outputString = usersRateLimit
							writer.Header().Set(rfc7231RateLimitHeader, "1")
						}
						writer.WriteHeader(testCase.statusCode)
						_, err := writer.Write([]byte(outputString))
						if err != nil {
							return
						}
					},
				),
			)
			defer server.Close()

			ctx := context.Background()
			client, err := NewConfluenceClient(ctx, "UserName", "ApiKey", server.URL)
			if err != nil {
				t.Fatal(err)
			}

			users, _, ratelimitData, err := client.GetUsers(ctx, "")

			if testCase.success {
				require.Nil(t, err)
				require.NotNil(t, users)
			} else {
				require.NotNil(t, err)
				require.GreaterOrEqual(t, ratelimitData.ResetAt.AsTime(), time.Now())
			}
		})
	}
}

func TestGetUsers(t *testing.T) {
	server := httptest.NewServer(
		http.HandlerFunc(
			func(writer http.ResponseWriter, request *http.Request) {
				writer.WriteHeader(http.StatusOK)
				_, err := writer.Write([]byte(usersListResults))
				if err != nil {
					return
				}
			},
		),
	)
	defer server.Close()

	ctx := context.Background()
	client, err := NewConfluenceClient(ctx, "UserName", "ApiKey", server.URL)
	if err != nil {
		t.Fatal(err)
	}

	users, token, ratelimitData, err := client.GetUsers(ctx, "")

	require.Nil(t, ratelimitData)
	require.Nil(t, err)

	// Expect an empty token because there are no more results.
	require.Equal(t, "", token)

	// Expect to see one user.
	require.NotNil(t, users)
	require.Len(t, users, 1)
	require.Equal(t, users[0].UserKey, "2c95808390139223019013bdb7ec0000")
}

func TestGetUsersPagination(t *testing.T) {
	server := httptest.NewServer(
		http.HandlerFunc(
			func(writer http.ResponseWriter, request *http.Request) {
				writer.WriteHeader(http.StatusOK)
				_, err := writer.Write([]byte(usersNoResults))
				if err != nil {
					return
				}
			},
		),
	)
	defer server.Close()

	ctx := context.Background()
	client, err := NewConfluenceClient(ctx, "UserName", "ApiKey", server.URL)
	if err != nil {
		t.Fatal(err)
	}

	// Setting page size to zero should still work.
	users, token, ratelimitData, err := client.GetUsers(ctx, "")

	require.Nil(t, ratelimitData)
	require.Nil(t, err)

	// Expect an empty token because there are no more results.
	require.Equal(t, "0", token)

	// Expect to see one user.
	require.NotNil(t, users)
	require.Len(t, users, 1)
	require.Equal(t, users[0].UserKey, "2c95808390139223019013bdb7ec0000")
}
