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
