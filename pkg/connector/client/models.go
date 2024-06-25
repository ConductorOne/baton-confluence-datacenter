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

type confluenceErrorResponse struct {
	StatusCode int    `json:"statusCode"`
	Message    string `json:"message"`
	Reason     string `json:"reason"`
}

type confluenceGroupList struct {
	Start   int
	Limit   int
	Size    int
	Results []ConfluenceGroup
}
