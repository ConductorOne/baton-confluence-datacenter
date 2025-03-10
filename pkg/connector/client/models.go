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
	Operation PermissionOperation `json:"operation,omitempty"`
	Subject   PermissionSubject   `json:"subject,omitempty"`
	SpaceKey  string              `json:"spaceKey,omitempty"`
}

type PermissionOperation struct {
	TargetType   string `json:"targetType"`
	OperationKey string `json:"operationKey"`
}

// PermissionSubject can be one of several types of resources. The ones we care about are: user (type: "user") or a group (type: "group")
type PermissionSubject struct {
	Type string `json:"type,omitempty"`

	//For groups:
	Name string `json:"name,omitempty"`

	// For users:
	UserKey string `json:"userKey,omitempty"`

	// For others:
	DisplayName string `json:"displayName,omitempty"`
}
