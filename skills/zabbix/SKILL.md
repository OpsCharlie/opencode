---
name: zabbix
description: Zabbix monitoring setup including templates, items, triggers, and API usage
---

## What I do

- Create and manage Zabbix templates, items, triggers, and graphs
- Use Zabbix API for automation and bulk operations
- Design monitoring strategies for Linux services and applications
- Write custom discovery rules and dependent items
- Configure alerts and escalations

## When to use me

Use this skill when working with Zabbix monitoring configuration, templates, or API calls. Activate when the user mentions zabbix, monitoring, template, trigger, item, or alert.

## Patterns

### Template structure
```yaml
# Template with linked templates
Template name: App - MyService
Groups: Applications
Linked templates: Template OS Linux by Zabbix agent
Items:
  - Key: my.service.status
    Type: Zabbix agent
    Update interval: 30s
Triggers:
  - Expression: last(/App - MyService/my.service.status)<>0
    Name: Service is down
    Severity: High
```

### Common agent keys
```
system.cpu.util[,idle]
vm.memory.size[available]
vfs.fs.size[/,pfree]
net.if.in[eth0]
proc.num[nginx]
log[/var/log/nginx/error.log]
```

### API usage pattern
```python
import requests

url = "http://zabbix/api_jsonrpc.php"
payload = {
    "jsonrpc": "2.0",
    "method": "host.get",
    "params": {
        "output": ["hostid", "host"],
        "filter": {"host": ["myhost"]}
    },
    "auth": token,
    "id": 1
}
response = requests.post(url, json=payload).json()
```

### Trigger expressions
```
# Service down
last(/Template/app.status)<>0

# High CPU (5min avg)
avg(/Template/system.cpu.util,5m)>90

# Low disk space
last(/Template/vfs.fs.size[/,pfree])<10

# Log pattern match
find(/Template/log[/var/log/app.log],,"regexp","ERROR")>0
```

### Best practices
- Use templates for reusable monitoring patterns
- Use dependent items to reduce agent load
- Use LLD (Low Level Discovery) for dynamic resources
- Set appropriate update intervals (don't poll too frequently)
- Use macros for template parameterization
- Group related items in application groups
