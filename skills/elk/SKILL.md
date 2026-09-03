---
name: elk
description: ELK stack query patterns, index management, and Kibana dashboard configuration
compatibility: opencode
---

## What I do

- Write Elasticsearch queries (ESQL)

## When to use me

Use this skill when working with Elasticsearch, Kibana, or the ELK stack. Activate when the user mentions elastic, kibana, elk, index, query, dashboard, or log analysis.

## Connection test

```esql
FROM logs-* | WHERE @timestamp > NOW() - 1 hour | LIMIT 1
```

## Environment notes

The `elk` MCP connects to Elasticsearch with a least-privilege read key. Know this before querying:

- **Use `elk_esql` only.** `elk_list_indices` and `elk_get_shards` are FORBIDDEN (403) — the key lacks `_cat` privileges. `elk_get_mappings` and `elk_search` are disallowed by policy even though they may work. Do everything — discovery, mapping inspection, search — through ES|QL.
- **Data streams** follow `logs-<dataset>-<namespace>` and `metrics-<dataset>-<namespace>`. Query broadly with `FROM logs-*` / `FROM metrics-*`, or target a dataset directly, e.g. `FROM logs-system.syslog-*`.
- **Audit data** lives in `audits-<dataset>-<namespace>` with a custom `data_stream.type: audits` (not `logs`). Datasets: `auditd` (very high volume), `system`, `file_integrity`. Auditd events carry `event.action` / `event.category`. Query with `FROM audits-*` or `FROM audits-auditd-*`.
- **Time field**: `@timestamp`.
- **Host key**: `host.name` (some datasets like cloudflare/github have `host.name = null`). `host.os.type` distinguishes `linux` / `windows`.
- **Dataset filter**: `data_stream.dataset` (e.g. `system.syslog`, `system.auth`, `system.security`, `windows.*`, `oracle.*`), and `data_stream.type` is `logs` or `metrics`.

### Discovery query (safe first step)
```esql
FROM logs-*,metrics-*,audits-* | STATS docs = COUNT(*) BY data_stream.type, data_stream.dataset | SORT docs DESC | LIMIT 40
```

### Common host investigation
```esql
FROM logs-* | WHERE host.name == "HOSTNAME" AND data_stream.dataset == "system.syslog" AND @timestamp > NOW() - 24 hours | KEEP @timestamp, process.name, message | SORT @timestamp DESC | LIMIT 50
```

### Linux hosts only
```esql
FROM logs-* | WHERE host.os.type == "linux" AND @timestamp > NOW() - 24 hours | KEEP @timestamp, host.name, message | SORT @timestamp DESC | LIMIT 10
```

### Windows hosts only
```esql
FROM logs-* | WHERE host.os.type == "windows" AND @timestamp > NOW() - 24 hours | KEEP @timestamp, host.name, event.code, message | SORT @timestamp DESC | LIMIT 10
```

### Advanced ES|QL Metric & Security Analysis

#### CPU and Memory metrics aggregation (5-minute buckets)
```esql
FROM metrics-* 
| WHERE host.name == "HOSTNAME" AND @timestamp > NOW() - 1 hour 
| STATS avg_cpu = AVG(system.cpu.actual.pct), max_memory = MAX(system.memory.actual.used.pct) BY bucket(@timestamp, 5 minutes) 
| SORT bucket DESC
```

#### Security Audit investigation (Sudo and Failed Logins)
```esql
FROM audits-* 
| WHERE @timestamp > NOW() - 24 hours AND (event.action == "sudo" OR event.outcome == "failure" OR event.category == "authentication") 
| KEEP @timestamp, host.name, user.name, event.action, event.outcome, message 
| SORT @timestamp DESC 
| LIMIT 100
```

#### Error and Log level trend by Host
```esql
FROM logs-* 
| WHERE @timestamp > NOW() - 12 hours AND (log.level == "error" OR log.level == "critical" OR message LIKE "*error*") 
| STATS error_count = COUNT(*) BY host.name, data_stream.dataset 
| SORT error_count DESC 
| LIMIT 20
```

## Patterns

### Elasticsearch Query DSL
```json
// Match with filters
{
  "query": {
    "bool": {
      "must": [{"match": {"message": "error"}}],
      "filter": [
        {"range": {"@timestamp": {"gte": "now-1h"}}},
        {"term": {"host.name": "webserver01"}}
      ]
    }
  }
}

// Aggregations
{
  "aggs": {
    "errors_by_host": {
      "terms": {"field": "host.name", "size": 10},
      "aggs": {
        "error_count": {
          "filter": {"term": {"level": "ERROR"}}
        }
      }
    }
  }
}
```

### KQL (Kibana Query Language)
```
message: "connection refused" and host.name: webserver*
level: ERROR or level: WARN
not process.name: nginx
response >= 500 and @timestamp >= "2024-01-01"
```

### Index lifecycle management
```
Hot phase:  ILM rollover at 50GB or 30d
Warm phase: Move to warm nodes after 7d, force merge
Cold phase: Move to cold after 30d, searchable snapshot
Delete:     Delete after 90d
```

### Common index patterns
```
logs-{service}-{yyyy.MM.dd}
metrics-{service}-{yyyy.MM.dd}
audit-{yyyy.MM.dd}
```

### Best practices
- Use data streams for time-series data
- Set appropriate mapping (don't rely on dynamic mapping)
- Use ILM for index lifecycle management
- Use KQL in Kibana for user-friendly queries
- Use Query DSL in scripts/API for precision
- Create index templates before first data ingestion
- Set `number_of_replicas` based on cluster size
