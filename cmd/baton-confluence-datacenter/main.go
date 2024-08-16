package main

import (
	"context"
	"fmt"
	"os"

	"github.com/conductorone/baton-confluence-datacenter/pkg/connector"
	configSchema "github.com/conductorone/baton-sdk/pkg/config"
	"github.com/conductorone/baton-sdk/pkg/connectorbuilder"
	"github.com/conductorone/baton-sdk/pkg/field"
	"github.com/conductorone/baton-sdk/pkg/types"
	"github.com/grpc-ecosystem/go-grpc-middleware/logging/zap/ctxzap"
	"github.com/spf13/viper"
	"go.uber.org/zap"
)

const (
	version       = "dev"
	connectorName = "baton-confluence-datacenter"
	accessToken   = "access-token"
	hostname      = "hostname"
	password      = "password"
	username      = "username"
)

var (
	accessTokenField    = field.StringField(accessToken, field.WithDescription("The personal access token for your Confluence Data Center account."))
	hostnameField       = field.StringField(hostname, field.WithRequired(true), field.WithDescription("The hostname (URL) for your Confluence Data Center."))
	passwordField       = field.StringField(password, field.WithDescription("The password for your Confluence Data Center account."))
	usernameField       = field.StringField(username, field.WithDescription("The username for your Confluence Data Center account."))
	configurationFields = []field.SchemaField{accessTokenField, hostnameField, passwordField, usernameField}
	fieldRelationships  = []field.SchemaFieldRelationship{
		field.FieldsAtLeastOneUsed(accessTokenField, usernameField),
		field.FieldsDependentOn(
			[]field.SchemaField{usernameField},
			[]field.SchemaField{passwordField},
		),
	}
)

func main() {
	ctx := context.Background()
	_, cmd, err := configSchema.DefineConfiguration(ctx,
		connectorName,
		getConnector,
		field.NewConfiguration(configurationFields, fieldRelationships...),
	)
	if err != nil {
		fmt.Fprintln(os.Stderr, err.Error())
		os.Exit(1)
	}

	cmd.Version = version
	err = cmd.Execute()
	if err != nil {
		fmt.Fprintln(os.Stderr, err.Error())
		os.Exit(1)
	}
}

func getConnector(ctx context.Context, cfg *viper.Viper) (types.ConnectorServer, error) {
	l := ctxzap.Extract(ctx)
	config := connector.Config{
		AccessToken: cfg.GetString(accessToken),
		Hostname:    cfg.GetString(hostname),
		UserName:    cfg.GetString(username),
		Password:    cfg.GetString(password),
	}
	cb, err := connector.New(ctx, config)
	if err != nil {
		l.Error("error creating connector", zap.Error(err))
		return nil, err
	}

	c, err := connectorbuilder.NewConnector(ctx, cb)
	if err != nil {
		l.Error("error creating connector", zap.Error(err))
		return nil, err
	}

	return c, nil
}
