![Baton Logo](./docs/images/baton-logo.png)

# baton-confluence-datacenter
Welcome to your new connector! 

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
      --access-token string    The personal access token for your Confluence Data Center account. ($BATON_ACCESS_TOKEN)
      --client-id string       The client ID used to authenticate with ConductorOne ($BATON_CLIENT_ID)
      --client-secret string   The client secret used to authenticate with ConductorOne ($BATON_CLIENT_SECRET)
  -f, --file string            The path to the c1z file to sync with ($BATON_FILE) (default "sync.c1z")
  -h, --help                   help for baton-confluence-datacenter
      --hostname string        required: The hostname (URL) for your Confluence Data Center. ($BATON_HOSTNAME)
      --log-format string      The output format for logs: json, console ($BATON_LOG_FORMAT) (default "json")
      --log-level string       The log level: debug, info, warn, error ($BATON_LOG_LEVEL) (default "info")
      --password string        The password for your Confluence Data Center account. ($BATON_PASSWORD)
  -p, --provisioning           This must be set in order for provisioning actions to be enabled ($BATON_PROVISIONING)
      --skip-full-sync         This must be set to skip a full sync ($BATON_SKIP_FULL_SYNC)
      --ticketing              This must be set to enable ticketing support ($BATON_TICKETING)
      --username string        The username for your Confluence Data Center account. ($BATON_USERNAME)
  -v, --version                version for baton-confluence-datacenter

Use "baton-confluence-datacenter [command] --help" for more information about a command.
```
