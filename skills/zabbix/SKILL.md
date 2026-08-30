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

## Connection test

```json
{
  "method": "apiinfo.version"
}
```

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

### API usage via MCP

When the Zabbix MCP is enabled, always use the `zabbix_zabbix_api` tool rather than writing raw Python scripts:

#### Get Zabbix version
```json
{
  "method": "apiinfo.version"
}
```

#### Find host by name
```json
{
  "method": "host.get",
  "params": {
    "output": ["hostid", "host", "name"],
    "filter": {"host": ["myhost"]}
  }
}
```

#### Get active problems/alerts
```json
{
  "method": "problem.get",
  "params": {
    "output": ["eventid", "name", "severity", "clock"],
    "selectAcknowledges": "extend",
    "recent": true,
    "sortfield": ["eventid"],
    "sortorder": "DESC"
  }
}
```

#### Get latest metric values for a host
```json
{
  "method": "item.get",
  "params": {
    "output": ["itemid", "name", "key_", "lastvalue", "lastclock"],
    "hostids": "10001",
    "search": {
      "key_": ["system.cpu.util", "vm.memory.size", "vfs.fs.size"]
    },
    "searchByAny": true
  }
}
```

#### Get host groups
```json
{
  "method": "hostgroup.get",
  "params": {
    "output": ["groupid", "name"]
  }
}
```

#### Get templates
```json
{
  "method": "template.get",
  "params": {
    "output": ["templateid", "host"],
    "filter": {"host": ["App - MyService"]}
  }
}
```

#### Create a host
```json
{
  "method": "host.create",
  "params": {
    "host": "myhost.example.com",
    "groups": [{"groupid": "12"}],
    "templates": [{"templateid": "10001"}],
    "interfaces": [{
      "type": 1,
      "main": 1,
      "useip": 1,
      "ip": "192.168.1.100",
      "dns": "myhost.example.com",
      "port": "10050"
    }]
  }
}
```

### Macros

Macros allow template parameterization. Use `{$MACRO}` in items, triggers, and prototypes.

#### User macros (set per host/template)
```json
{
  "method": "usermacro.create",
  "params": {
    "hostid": "10001",
    "macro": "{$SERVICE_URL}",
    "value": "https://api.example.com"
  }
}
```

#### Common macro patterns
```
{$SERVICE_URL}:     https://api.example.com
{$SERVICE_PORT}:    443
{$SERVICE_TIMEOUT}: 30
{$DISK_LOW}:        10
{$CPU_HIGH}:        90
```

#### Using macros in triggers
```
# Threshold macros
last(/Template/service.status)<>0

# Macro in trigger name
Service {$SERVICE_URL} is down on {HOST.NAME}

# Macro in thresholds
avg(/Template/system.cpu.util,5m)>{$CPU_HIGH}
```

### Low Level Discovery (LLD)

LLD automatically creates items, triggers, and graphs for dynamic resources (interfaces, disks, services, etc.).

#### LLD macro patterns
```
{#IFNAME}      - Interface name (eth0, eth1)
{#IFSTATUS}    - Interface operational status
{#DISKNAME}    - Disk name (sda, sdb)
{#FSNAME}      - Filesystem mount point
{#SNMPINDEX}   - SNMP index
```

#### Create a discovery rule
```json
{
  "method": "discoveryrule.create",
  "params": {
    "hostid": "10001",
    "name": "Network interfaces",
    "key_": "net.if.discovery",
    "type": 0,
    "delay": "1h",
    "lifetime": "30d"
  }
}
```

#### Create a prototype item (LLD prototype)
```json
{
  "method": "itemprototype.create",
  "params": {
    "discoveryid": "10002",
    "name": "Traffic on {#IFNAME}",
    "key_": "net.if.in[{#IFNAME}]",
    "type": 0,
    "delay": "30s",
    "value_type": 3
  }
}
```

#### Create a prototype trigger
```json
{
  "method": "triggerprototype.create",
  "params": {
    "discoveryid": "10002",
    "description": "Interface {#IFNAME} is down",
    "expression": "last(/Host/net.if.status[{#IFNAME}])=0",
    "priority": 3
  }
}
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

# Host macro threshold
avg(/Template/system.cpu.util,5m)>{$CPU_HIGH}

# Multiple conditions
last(/Template/net.if.status[eth0])=0 and avg(/Template/net.if.in[eth0],5m)>0
```

### Best practices
- Use templates for reusable monitoring patterns
- Use dependent items to reduce agent load
- Use LLD (Low Level Discovery) for dynamic resources
- Set appropriate update intervals (don't poll too frequently)
- Use macros for template parameterization
- Group related items in application groups
- Use `searchByAny: true` when searching across multiple key patterns
