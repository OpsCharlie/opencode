---
name: foreman
description: Foreman host provisioning, content management, and lifecycle management
---

## What I do

- Manage host provisioning and registration
- Configure content views, lifecycle environments, and content credentials
- Manage kickstart and PXE boot templates
- Work with host groups, parameters, and Puppet/Ansible integration
- Use Hammer CLI for automation

## When to use me

Use this skill when working with Foreman, Katello, or Red Hat Satellite host provisioning and content management. Activate when the user mentions foreman, katello, satellite, provisioning, or host group.

## Patterns

### Hammer CLI commands
```bash
# List hosts
hammer host list --search "status = active"

# Create host
hammer host create \
  --name myhost \
  --organization "MyOrg" \
  --location "MyLocation" \
  --hostgroup "RHEL8-Baseline" \
  --mac 00:11:22:33:44:55 \
  --build true

# Update host parameters
hammer host set-parameter --host myhost --name parameter-name --value parameter-value

# Content view management
hammer content-view list
hammer content-view publish --name "My ContentView"
hammer content-view version promote --name "My ContentView" --version 1 --to-lifecycle-environment "Production"
```

### Host group structure
```
Host Group: RHEL8-Baseline
  Parent: RHEL8
  Lifecycle Environment: Production
  Content View: Base OS
  Puppet Environment: production
  Parameters:
    - ansible_groups: "webservers,monitoring"
    - root_password: "{{ ENC::<encrypted> }}"
```

### Provisioning workflow
1. Create content view with required repositories
2. Publish and promote through lifecycle environments
3. Create host group with baseline configuration
4. Register hosts via PXE boot or Kickstart
5. Apply configuration via Ansible/Puppet

### Best practices
- Use host groups for reusable configurations
- Use lifecycle environments for promotion pipeline
- Use content credentials for GPG keys and SSL certs
- Use Hammer CLI scripts for bulk operations
- Version content views for reproducibility
- Use parameters for host-specific overrides
- Keep host groups hierarchical (parent/child)
