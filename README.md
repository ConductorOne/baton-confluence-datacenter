![Baton Logo](./docs/images/baton-logo.png)

# `baton-confluence-datacenter` [![Go Reference](https://pkg.go.dev/badge/github.com/conductorone/baton-confluence-datacenter.svg)](https://pkg.go.dev/github.com/conductorone/baton-confluence-datacenter) ![main ci](https://github.com/conductorone/baton-confluence-datacenter/actions/workflows/main.yaml/badge.svg)

`baton-confluence-datacenter` is an example connector built using the [Baton SDK](https://github.com/conductorone/baton-sdk). It uses hardcoded data to provide a simple example of how to build your own connector with Baton.

Check out [Baton](https://github.com/conductorone/baton) to learn more about the project in general.

# Getting Started
To start out, you will want to update the dependencies.
Do this by running `make update-deps`.

## brew
```
brew install conductor/baton/baton conductor/baton/baton-confluence-datacenter

baton-confluence-datacenter
baton resources
```

## docker
```
docker run --rm -v $(pwd):/out -e BATON_ACCESS_TOKEN=access_token -e BATON_HOSTNAME=hostname ghcr.io/conductorone/baton-confluence-datacenter:latest -f "/out/sync.c1z"
docker run --rm -v $(pwd):/out ghcr.io/conductorone/baton:latest -f "/out/sync.c1z" resources
```

## source
```
go install github.com/conductorone/baton/cmd/baton@main
go install github.com/conductorone/baton-confluence-datacenter/cmd/baton-confluence-datacenter@main

BATON_ACCESS_TOKEN=access_token BATON_HOSTNAME=hostname baton-confluence-datacenter 
baton resources
```

# 

# Contributing, Support and Issues

We started Baton because we were tired of taking screenshots and manually building spreadsheets.  We welcome contributions, and ideas, no matter how small -- our goal is to make identity and permissions sprawl less painful for everyone.  If you have questions, problems, or ideas: Please open a Github Issue!

See [CONTRIBUTING.md](https://github.com/ConductorOne/baton/blob/main/CONTRIBUTING.md) for more details.

# `baton-confluence-datacenter` Command Line Usage
```
baton-confluence-datacenter

Usage:
  baton-confluence-datacenter [flags]
  baton-confluence-datacenter [command]

Available Commands:
  capabilities       Get connector capabilities
  completion         Generate the autocompletion script for the specified shell
  help               Help about any command

Flags:
      --access-token string               The personal access token for your Confluence Data Center account. ($BATON_ACCESS_TOKEN)
      --client-id string                  The client ID used to authenticate with ConductorOne ($BATON_CLIENT_ID)
      --client-secret string              The client secret used to authenticate with ConductorOne ($BATON_CLIENT_SECRET)
      --disable-slash-support-group-name  This must be set to disable the slash support group name. (default "false")
  -f, --file string                       The path to the c1z file to sync with ($BATON_FILE) (default "sync.c1z")
  -h, --help                              help for baton-confluence-datacenter
      --hostname string                   required: The hostname (URL) for your Confluence Data Center. ($BATON_HOSTNAME)
      --log-format string                 The output format for logs: json, console ($BATON_LOG_FORMAT) (default "json")
      --log-level string                  The log level: debug, info, warn, error ($BATON_LOG_LEVEL) (default "info")
      --password string                   The password for your Confluence Data Center account. ($BATON_PASSWORD)
  -p, --provisioning                      This must be set in order for provisioning actions to be enabled ($BATON_PROVISIONING)
      --skip-full-sync                    This must be set to skip a full sync ($BATON_SKIP_FULL_SYNC)
      --ticketing                         This must be set to enable ticketing support ($BATON_TICKETING)
      --username string                   The username for your Confluence Data Center account. ($BATON_USERNAME)
  -v, --version                           version for baton-confluence-datacenter

Use "baton-confluence-datacenter [command] --help" for more information about a command.
```

## Slash Support in Group Names

By default, Baton for Confluence Data Center includes special handling for groups containing forward slashes ('/') in their names. This is necessary due to a Confluence API limitation where certain endpoints don't properly handle group names containing slashes (see [CONFCLOUD-68869](https://jira.atlassian.com/browse/CONFCLOUD-68869)).

### Default Behavior (Slash Support Enabled)
When slash support is enabled (default):
- Groups with slashes in their names (e.g., "Engineering/Frontend") are properly synced
- The connector automatically detects if any groups contain slashes:
  - If slashed groups are found: Uses an alternative API approach with caching for group memberships
  - If no slashed groups are found: Uses direct membership API calls for better performance
- Group listing, entitlement listing, and grants listing operations fully support groups with slashes in their names
- Grant and revoke operations for groups containing slashes are blocked with a warning message due to Confluence API limitations

### When to Disable Slash Support
Set `--disable-slash-support-group-name` to true if:
- You want to force using direct group membership API calls for better performance
- Note: If groups with slashes exist when this is disabled:
  - Those groups will return "not found" errors
  - The connector will log warnings about these inaccessible groups
  - Consider this option only if you accept losing access to slashed group names
