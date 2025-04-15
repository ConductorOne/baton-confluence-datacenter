package client

import (
	"context"

	v2 "github.com/conductorone/baton-sdk/pb/c1/connector/v2"
)

// ConfluenceService defines the interface for group operations
type ConfluenceService interface {
	GetUsers(ctx context.Context, pageToken string) ([]ConfluenceUser, string, *v2.RateLimitDescription, error)
	GetUserByKey(ctx context.Context, userKey string) (*ConfluenceUser, error)
	GetGroups(ctx context.Context, pageToken string) ([]ConfluenceGroup, string, *v2.RateLimitDescription, error)
	GetGroupMembers(ctx context.Context, pageToken, groupName string) ([]ConfluenceUser, string, *v2.RateLimitDescription, error)
	GetGroupsByUserKey(ctx context.Context, pageToken, userKey string) ([]ConfluenceGroup, string, *v2.RateLimitDescription, error)
	GetSpaces(ctx context.Context, pageToken string) ([]ConfluenceSpace, string, *v2.RateLimitDescription, error)
	GetSpacePermissions(ctx context.Context, spaceKey string) ([]ConfluenceSpacePermission, *v2.RateLimitDescription, error)
	UpdateSpacePermissions(ctx context.Context, currentOperations []PermissionOperation, spaceKey string, userKey string, groupName string) (*v2.RateLimitDescription, error)
	AddGroupMember(ctx context.Context, userKey, groupName string) (*v2.RateLimitDescription, error)
	RemoveGroupMember(ctx context.Context, userKey, groupName string) (*v2.RateLimitDescription, error)
}

// ConfluenceServiceImpl is the default implementation that calls the actual API
type ConfluenceServiceImpl struct {
	client ConfluenceClient
}

func NewConfluenceService(client ConfluenceClient) ConfluenceService {
	return &ConfluenceServiceImpl{client: client}
}

func (s *ConfluenceServiceImpl) GetUsers(ctx context.Context, pageToken string) ([]ConfluenceUser, string, *v2.RateLimitDescription, error) {
	return s.client.GetUsers(ctx, pageToken)
}

func (s *ConfluenceServiceImpl) GetUserByKey(ctx context.Context, userKey string) (*ConfluenceUser, error) {
	return s.client.GetUserByKey(ctx, userKey)
}

func (s *ConfluenceServiceImpl) GetGroups(ctx context.Context, pageToken string) ([]ConfluenceGroup, string, *v2.RateLimitDescription, error) {
	return s.client.GetGroups(ctx, pageToken)
}

func (s *ConfluenceServiceImpl) GetGroupMembers(ctx context.Context, pageToken, groupName string) ([]ConfluenceUser, string, *v2.RateLimitDescription, error) {
	return s.client.GetGroupMembers(ctx, pageToken, groupName)
}

func (s *ConfluenceServiceImpl) GetGroupsByUserKey(ctx context.Context, pageToken, userKey string) ([]ConfluenceGroup, string, *v2.RateLimitDescription, error) {
	return s.client.GetGroupsByUserKey(ctx, pageToken, userKey)
}

func (s *ConfluenceServiceImpl) GetSpaces(ctx context.Context, pageToken string) ([]ConfluenceSpace, string, *v2.RateLimitDescription, error) {
	return s.client.GetSpaces(ctx, pageToken)
}

func (s *ConfluenceServiceImpl) GetSpacePermissions(ctx context.Context, spaceKey string) ([]ConfluenceSpacePermission, *v2.RateLimitDescription, error) {
	return s.client.GetSpacePermissions(ctx, spaceKey)
}

func (s *ConfluenceServiceImpl) UpdateSpacePermissions(ctx context.Context, currentOperations []PermissionOperation, spaceKey string, userKey string, groupName string) (*v2.RateLimitDescription, error) {
	return s.client.UpdateSpacePermissions(ctx, currentOperations, spaceKey, userKey, groupName)
}

func (s *ConfluenceServiceImpl) AddGroupMember(ctx context.Context, userKey, groupName string) (*v2.RateLimitDescription, error) {
	return s.client.AddGroupMember(ctx, userKey, groupName)
}

func (s *ConfluenceServiceImpl) RemoveGroupMember(ctx context.Context, userKey, groupName string) (*v2.RateLimitDescription, error) {
	return s.client.RemoveGroupMember(ctx, userKey, groupName)
}
