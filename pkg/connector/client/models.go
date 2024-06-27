package client

type ConfluenceUser struct {
	DisplayName string `json:"displayName"`
	Type        string `json:"type"`
	UserKey     string `json:"userKey"`
	Username    string `json:"username"`
}

type confluenceUserList struct {
	Start   int
	Limit   int
	Size    int
	Results []ConfluenceUser
}

type ConfluenceGroup struct {
	Name string `json:"name"`
	Type string `json:"type"`
}

type confluenceGroupList struct {
	Start   int
	Limit   int
	Size    int
	Results []ConfluenceGroup
}

type ConfluenceSpaceDescriptionValue struct {
	Value          string `json:"value"`
	Representation string `json:"representation"`
}

type ConfluenceSpaceDescription struct {
	Plain ConfluenceSpaceDescriptionValue `json:"plain"`
}

type ConfluenceSpace struct {
	Id          int                        `json:"id"`
	Description ConfluenceSpaceDescription `json:"description"`
	Key         string                     `json:"key"`
	Name        string                     `json:"name"`
	Type        string                     `json:"type"`
}

type confluenceSpaceList struct {
	Start   int
	Limit   int
	Size    int
	Results []ConfluenceSpace
}

type ConfluenceSpacePermission struct {
	GroupName string `json:"groupName"`
	Type      string `json:"type"` // duplicate of the `Type` from above.
	UserName  string `json:"userName"`
}

type ConfluenceSpacePermissionList struct {
	SpacePermissions []ConfluenceSpacePermission `json:"spacePermissions"`
	Type             string                      `json:"type"`
}
