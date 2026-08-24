---
name: foreman
description: Foreman content management, lifecycle environments, and host metadata querying
compatibility: opencode
---

# Foreman

## What I do

- Configure content views, lifecycle environments, and content credentials
- Work with host groups, parameters, and Puppet/Ansible integration
- Use Foreman REST API for host audits, package lists, errata, and querying

## When to use me

Use this skill when working with Foreman, Katello, or Red Hat Satellite host metadata, lifecycle environments, or content management. Activate when the user mentions foreman, katello, satellite, errata, packages, or host group.

## Connection test

```json
{
  "resource": "ping",
  "action": "index",
  "params": {}
}
```

## Patterns

### Foreman MCP Tool Usage (Preferred)

When the Foreman MCP is enabled, always use the built-in `foreman_call_foreman_api_get` tool rather than writing raw Python scripts:

#### 1. List active hosts

```json
{
  "resource": "hosts",
  "action": "index",
  "params": {
    "search": "status = active"
  }
}
```

#### 2. Show host parameters (including inherited parameters)

```json
{
  "resource": "hosts",
  "action": "show",
  "params": {
    "id": "myhost.example.com"
  }
}
```

#### 3. Get host facts (reported from systems, e.g. kernel, CPUs)

```json
{
  "resource": "fact_values",
  "action": "index",
  "params": {
    "search": "host = myhost.example.com"
  }
}
```

#### 4. List installed packages on a host (Katello)

```json
{
  "resource": "packages",
  "action": "index",
  "params": {
    "host_id": "myhost.example.com"
  }
}
```

#### 5. List applicable errata for a host (Katello)

```json
{
  "resource": "errata",
  "action": "index",
  "params": {
    "host_id": "myhost.example.com"
  }
}
```

#### 6. Install errata on a host (Katello)

```json
{
  "resource": "host_errata",
  "action": "install",
  "params": {
    "host_id": "myhost.example.com",
    "errata_ids": ["RHSA-2024:1234"]
  }
}
```

#### 7. List lifecycle environments

```json
{
  "resource": "lifecycle_environments",
  "action": "index",
  "params": {
    "organization_id": "1"
  }
}
```

#### 8. List content views

```json
{
  "resource": "content_views",
  "action": "index",
  "params": {
    "organization_id": "1"
  }
}
```

#### 9. Publish a content view version

```json
{
  "resource": "content_view_versions",
  "action": "publish",
  "params": {
    "id": "20"
  }
}
```

#### 10. Promote a content view version to a lifecycle environment

```json
{
  "resource": "content_view_versions",
  "action": "promote",
  "params": {
    "id": "42",
    "environment_ids": ["5"]
  }
}
```

### Common search filters

Foreman supports powerful search syntax across most resources:

```
status = active                    # Host status
status = error                     # Hosts with errors
last_report < "30 days ago"        # Stale hosts
os = AlmaLinux 8.10                # Filter by OS
hostgroup = DB                     # Filter by host group
organization = Sofico              # Filter by organization
location = SSB                     # Filter by location
certname ~ "web*"                  # Wildcard match on cert name
has_errata = true                  # Hosts with applicable errata
subscription_status = valid        # Hosts with valid subscription
```

### Host group structure

```text
Host Groups:
  - DB (Database servers)
  - APP (Application servers)
  - Default (Baseline servers)
  - Management (Management/admin systems)

Organizations:
  - Organization_A
  - Organization_B

Locations:
  - Location_1
  - Location_2
  - Location_3
```

### Best practices

- Use host groups for reusable configurations
- Use lifecycle environments for promotion pipeline
- Use content credentials for GPG keys and SSL certs
- Use Foreman API scripts for bulk operations
- Version content views for reproducibility
- Use parameters for host-specific overrides
- Keep host groups hierarchical (parent/child)
