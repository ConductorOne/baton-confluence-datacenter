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
	UserName string
	ApiKey   string
	Domain   string
}

type Confluence struct {
	client   client.ConfluenceClient
	domain   string
	apiKey   string
	userName string
}

func New(ctx context.Context, config Config) (*Confluence, error) {
	confluenceClient, err := client.NewConfluenceClient(ctx, config.UserName, config.ApiKey, config.Domain)
	if err != nil {
		return nil, err
	}
	rv := &Confluence{
		domain:   config.Domain,
		apiKey:   config.ApiKey,
		userName: config.UserName,
		client:   *confluenceClient,
	}
	return rv, nil
}

func (c *Confluence) Metadata(ctx context.Context) (*v2.ConnectorMetadata, error) {
	var annos annotations.Annotations
	annos.Update(&v2.ExternalLink{
		Url: c.domain,
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
