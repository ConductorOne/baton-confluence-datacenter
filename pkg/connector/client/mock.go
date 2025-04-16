package client

import (
	"context"

	v2 "github.com/conductorone/baton-sdk/pb/c1/connector/v2"
)

// MockConfluenceService is a mock implementation of the ConfluenceService interface for testing.
type MockConfluenceService struct {
	GetUsersFunc               func(ctx context.Context, pageToken string) ([]ConfluenceUser, string, *v2.RateLimitDescription, error)
	GetUserByKeyFunc           func(ctx context.Context, userKey string) (*ConfluenceUser, error)
	GetGroupsFunc              func(ctx context.Context, pageToken string) ([]ConfluenceGroup, string, *v2.RateLimitDescription, error)
	GetGroupMembersFunc        func(ctx context.Context, pageToken, groupName string) ([]ConfluenceUser, string, *v2.RateLimitDescription, error)
	GetGroupsByUserKeyFunc     func(ctx context.Context, pageToken, userKey string) ([]ConfluenceGroup, string, *v2.RateLimitDescription, error)
	GetSpacesFunc              func(ctx context.Context, pageToken string) ([]ConfluenceSpace, string, *v2.RateLimitDescription, error)
	GetSpacePermissionsFunc    func(ctx context.Context, spaceKey string) ([]ConfluenceSpacePermission, *v2.RateLimitDescription, error)
	UpdateSpacePermissionsFunc func(ctx context.Context, currentOperations []PermissionOperation, spaceKey string, userKey string, groupName string) (*v2.RateLimitDescription, error)
	AddGroupMemberFunc         func(ctx context.Context, userKey, groupName string) (*v2.RateLimitDescription, error)
	RemoveGroupMemberFunc      func(ctx context.Context, userKey, groupName string) (*v2.RateLimitDescription, error)
}

func (m *MockConfluenceService) GetUsers(ctx context.Context, pageToken string) ([]ConfluenceUser, string, *v2.RateLimitDescription, error) {
	return m.GetUsersFunc(ctx, pageToken)
}

func (m *MockConfluenceService) GetUserByKey(ctx context.Context, userKey string) (*ConfluenceUser, error) {
	return m.GetUserByKeyFunc(ctx, userKey)
}

func (m *MockConfluenceService) GetGroups(ctx context.Context, pageToken string) ([]ConfluenceGroup, string, *v2.RateLimitDescription, error) {
	return m.GetGroupsFunc(ctx, pageToken)
}

func (m *MockConfluenceService) GetGroupMembers(ctx context.Context, pageToken, groupName string) ([]ConfluenceUser, string, *v2.RateLimitDescription, error) {
	return m.GetGroupMembersFunc(ctx, pageToken, groupName)
}

func (m *MockConfluenceService) GetGroupsByUserKey(ctx context.Context, pageToken, userKey string) ([]ConfluenceGroup, string, *v2.RateLimitDescription, error) {
	return m.GetGroupsByUserKeyFunc(ctx, pageToken, userKey)
}

func (m *MockConfluenceService) GetSpaces(ctx context.Context, pageToken string) ([]ConfluenceSpace, string, *v2.RateLimitDescription, error) {
	return m.GetSpacesFunc(ctx, pageToken)
}

func (m *MockConfluenceService) GetSpacePermissions(ctx context.Context, spaceKey string) ([]ConfluenceSpacePermission, *v2.RateLimitDescription, error) {
	return m.GetSpacePermissionsFunc(ctx, spaceKey)
}

func (m *MockConfluenceService) UpdateSpacePermissions(
	ctx context.Context,
	currentOperations []PermissionOperation,
	spaceKey string,
	userKey string,
	groupName string,
) (*v2.RateLimitDescription, error) {
	return m.UpdateSpacePermissionsFunc(ctx, currentOperations, spaceKey, userKey, groupName)
}

func (m *MockConfluenceService) AddGroupMember(ctx context.Context, userKey, groupName string) (*v2.RateLimitDescription, error) {
	return m.AddGroupMemberFunc(ctx, userKey, groupName)
}

func (m *MockConfluenceService) RemoveGroupMember(ctx context.Context, userKey, groupName string) (*v2.RateLimitDescription, error) {
	return m.RemoveGroupMemberFunc(ctx, userKey, groupName)
}
