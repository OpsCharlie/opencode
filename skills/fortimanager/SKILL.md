---
name: fortimanager
description: FortiManager content management, firewall policies, device provisioning, CLI scripts, templates, and SD-WAN configuration
compatibility: opencode
---

## What I do

- Query firewall policies and policy packages
- Query firewall objects (addresses, services, VIPs, groups)
- Query FortiGate devices and their status
- Query CLI scripts and execution logs
- Query provisioning templates, system templates, and CLI template groups
- Query SD-WAN templates and assignments
- Monitor background tasks and installations

## When to use me

Use this skill when working with FortiManager for centralized firewall policy management, device provisioning, or network configuration. Activate when the user mentions fortimanager, fmg, policy package, firewall policy, device provisioning, CLI script, ADOM, SD-WAN template, or FortiGate management.

## Connection test

```json
{
  "tool_name": "list_adoms",
  "parameters": {}
}
```

## API access

This MCP uses a read-only API token. Write operations (create, update, delete, lock, commit) are **not available**. Use this skill for querying and auditing only.

## Available tool categories

| Category | Tools | Description |
|----------|-------|-------------|
| **system** | 17 | System status, ADOM management, tasks, packages |
| **device** | 12 | Device management, VDOMs, bulk operations |
| **policy** | 15 | Firewall policies, packages, installation |
| **object** | 24 | Addresses, services, groups, object search |
| **script** | 12 | CLI scripts, execution, logs |
| **template** | 15 | Provisioning templates, system templates, CLI template groups |
| **sdwan** | 7 | SD-WAN templates, assignment |

## Dynamic mode

When `FMG_TOOL_MODE=dynamic`, only 4 discovery tools are loaded to save context:
- `find_fortimanager_tool(operation)` — Search for tools by keyword
- `list_fortimanager_categories()` — List tool categories
- `execute_fortimanager_tool(name, params)` — Execute any tool by name
- `health_check()` — Server health status

## Common usage patterns (read-only)

### Policy Management

```
list_packages({"adom": "root"})
get_package({"adom": "root", "name": "default"})
list_firewall_policies({"adom": "root", "package": "default"})
get_firewall_policy({"adom": "root", "package": "default", "policy_id": 1})
search_firewall_policies({"adom": "root", "filters": {"srcaddr": ["192.168.1.0/24"]}})
get_policy_services({"adom": "root", "package": "default", "policy_id": 1})
```

### Object Management

```
list_addresses({"adom": "root"})
get_address({"adom": "root", "name": "web-server"})
list_address_groups({"adom": "root"})
get_address_group({"adom": "root", "name": "internal-servers"})
list_services({"adom": "root"})
get_service({"adom": "root", "name": "custom-https"})
list_service_groups({"adom": "root"})
get_service_group({"adom": "root", "name": "web-services"})
search_objects({"adom": "root", "query": "web"})
```

### Device Management

```
list_devices({"adom": "root"})
get_device({"adom": "root", "device": "FGT-01"})
get_device_status({"adom": "root", "device": "FGT-01"})
list_device_vdoms({"adom": "root", "device": "FGT-01"})
get_device_interfaces({"adom": "root", "device": "FGT-01"})
search_devices({"adom": "root", "filters": {"os_ver": "7"}})
```

### Script Execution

```
list_scripts({"adom": "root"})
get_script({"adom": "root", "name": "backup-config"})
get_script_log_latest({"adom": "root", "script": "backup-config", "device": "FGT-01"})
get_script_log_summary({"adom": "root", "script": "backup-config"})
```

### System Operations

```
get_system_status()
get_ha_status()
list_tasks()
get_task({"task_id": 123})
wait_for_task({"task_id": 123})
```

### SD-WAN Templates

```
list_sdwan_templates({"adom": "root"})
get_sdwan_template({"adom": "root", "name": "branch-sdwan"})
```

### Template Management

```
list_system_templates({"adom": "root"})
get_system_template({"adom": "root", "name": "Branch-Template"})
list_cli_template_groups({"adom": "root"})
get_cli_template_group({"adom": "root", "name": "branch-templates"})
validate_template({"adom": "root", "template": "Branch-Template", "device": "FGT-01"})
```

## Safety patterns

### Check device status before querying scripts or device-specific data

```
1. get_device_status({"adom": "root", "device": "FGT-01"})
2. Verify device is connected (status == "connected")
3. Then query scripts, VDOMs, or interfaces
```

### Validate template against device

```
1. get_device_status({"adom": "root", "device": "FGT-01"})
2. validate_template({"adom": "root", "template": "Branch-Template", "device": "FGT-01"})
3. Check validation result before proceeding
```

## Error handling

### Common errors

| Error | Meaning | Action |
|-------|---------|--------|
| `ADOM locked` | Another user has the ADOM locked | Wait or contact admin |
| `Device not connected` | FortiGate is offline | Check device connectivity |
| `No permission` | API token lacks required access | Verify admin profile permissions |
| `Object not found` | Wrong ADOM or object name | Check ADOM scope and naming |

### Detecting ADOM lock status

```
get_adom({"adom": "root"})
# Check "workspace_mode" and "lock_override" fields
# workspace_mode=1 means ADOM uses workspace mode (requires locking for writes)
```

## Best practices

- Use `find_fortimanager_tool` to discover the right tool in dynamic mode
- Check `get_device_status` before querying device-specific data
- Use `wait_for_task` after long-running operations to confirm completion
- Default ADOM can be set via `DEFAULT_ADOM` env var (defaults to `root`)
- Use `search_firewall_policies` and `search_objects` for complex queries
