package connector

import (
	"context"
	"fmt"
	"io"

	"github.com/conductorone/baton-confluence-datacenter/pkg/connector/client"
	v2 "github.com/conductorone/baton-sdk/pb/c1/connector/v2"
	"github.com/conductorone/baton-sdk/pkg/annotations"
	"github.com/conductorone/baton-sdk/pkg/connectorbuilder"
)

type Config struct {
	ApiKey   string
	Hostname string
	UserName string
}

type Confluence struct {
	client   client.ConfluenceClient
	apiKey   string
	hostname string
	userName string
}

func New(ctx context.Context, config Config) (*Confluence, error) {
	confluenceClient, err := client.NewConfluenceClient(ctx, config.UserName, config.ApiKey, config.Hostname)
	if err != nil {
		return nil, err
	}
	rv := &Confluence{
		apiKey:   config.ApiKey,
		client:   *confluenceClient,
		hostname: config.Hostname,
		userName: config.UserName,
	}
	return rv, nil
}

func (c *Confluence) Metadata(ctx context.Context) (*v2.ConnectorMetadata, error) {
	var annos annotations.Annotations
	annos.Update(&v2.ExternalLink{
		Url: c.hostname,
	})

	return &v2.ConnectorMetadata{
		DisplayName: "Confluence",
		Description: "Connector syncing Confluence users and groups to Baton",
		Annotations: annos,
	}, nil
}

func (c *Confluence) Validate(ctx context.Context) (annotations.Annotations, error) {
	err := c.client.Verify(ctx)
	if err != nil {
		return nil, fmt.Errorf("confluence-connector: failed to validate API keys: %w", err)
	}

	return nil, nil
}

func (c *Confluence) Asset(ctx context.Context, asset *v2.AssetRef) (string, io.ReadCloser, error) {
	return "", nil, nil
}

func (c *Confluence) ResourceSyncers(ctx context.Context) []connectorbuilder.ResourceSyncer {
	return []connectorbuilder.ResourceSyncer{
		newGroupBuilder(c.client),
		newUserBuilder(c.client),
	}
}
