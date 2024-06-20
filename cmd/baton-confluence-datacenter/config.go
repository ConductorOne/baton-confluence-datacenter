package main

import (
	"context"
	"fmt"

	"github.com/conductorone/baton-sdk/pkg/cli"
	"github.com/spf13/cobra"
)

// config defines the external configuration required for the connector to run.
type config struct {
	cli.BaseConfig `mapstructure:",squash"` // Puts the base config options in the same place as the connector options

	AccessToken string `mapstructure:"access-token"`
	Hostname    string `mapstructure:"hostname"`
	Password    string `mapstructure:"password"`
	Username    string `mapstructure:"username"`
}

// validateConfig is run after the configuration is loaded, and should return an error if it isn't valid.
func validateConfig(ctx context.Context, cfg *config) error {
	if cfg.Hostname == "" {
		return fmt.Errorf("hostname is missing")
	}
	if cfg.AccessToken == "" {
		if cfg.Username == "" && cfg.Password == "" {
			return fmt.Errorf("either access token or (username, password) pair must be provided")
		}
		if cfg.Username == "" {
			return fmt.Errorf("username is missing")
		}
		if cfg.Password == "" {
			return fmt.Errorf("password is missing")
		}
	}

	return nil
}

// cmdFlags sets the cmdFlags required for the connector.
func cmdFlags(cmd *cobra.Command) {
	cmd.PersistentFlags().String(
		"hostname",
		"",
		"The hostname (URL) for your Confluence Data Center. ($BATON_HOSTNAME)",
	)
	cmd.PersistentFlags().String(
		"access-token",
		"",
		"The personal access token for your Confluence Data Center account. ($BATON_ACCESS_TOKEN)",
	)
	cmd.PersistentFlags().String(
		"username",
		"",
		"The username for your Confluence Data Center account. ($BATON_USERNAME)",
	)
	cmd.PersistentFlags().String(
		"password",
		"",
		"The password for your Confluence Data Center account. ($BATON_PASSWORD)",
	)
}
