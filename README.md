# Ynfra / Terraform

This repository contains Terraform modules.

# Requirements

- Terraform (https://learn.hashicorp.com/tutorials/terraform/install-cli)
- Terraform docs (https://terraform-docs.io/)
- Make (Makefile)

# Modules

- [adminer](adminer) - Database management in a single PHP file
- [altair-graphql](altair-graphql) - GraphQL playground
- [blackfire](blackfire) - Blackfire server
- [cf-r2](cf-r2) - Cloudflare R2
- [cf-r2-token](cf-r2-token) - Cloudflare R2 token
- [checkly](checkly) - Checkly agent on-premise
- [echo](echo) - Simple echo service
- [kroki](kroki) - Creates diagrams from textual descriptions
- [mariadb](mariadb) - MariaDB
- [metabase](metabase) - Metabase business intelligence, dashboards, and data visualization tools
- [minio](minio) - S3-like storage
- [minio-bucket](mariadb) - Managa minio buckets
- [mockbin](mockbin) - HTTP fake server
- [n8n](n8n) - A powerful workflow automation tool
- [nexus](nexus) - Multi package system (apt, docker, yum, raw)
- [postgres](postgres) - PostgreSQL
- [proxyman](proxyman) - HTTP proxy
- [redoc](redoc) - OpenAPI/Swagger-generated API Reference Documentation
- [repman](repman) - Private PHP Repository Manager
- [retool](retool) - The fastest way to develop effective software
- [uptime](uptime) - A fancy self-hosted monitoring tool + SQlite streaming to S3
- [windmill](windmill) - Low-code platform

# Usage

## Terraform

- `terraform init` - install requirements
- `terraform upgrade` - upgrade requirements
- `terraform fmt` - check format
- `terraform validate` - validate configs
- `terraform plan` - project plan
- `terraform apply` - apply plan
