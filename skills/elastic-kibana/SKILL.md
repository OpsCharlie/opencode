---
name: elastic-kibana
description: ELK stack query patterns, index management, and Kibana dashboard configuration
---

## What I do

- Write Elasticsearch queries (Query DSL, KQL, Lucene)
- Design index patterns and mappings
- Create Kibana dashboards, visualizations, and saved searches
- Configure index lifecycle management (ILM)
- Set up alerts and anomaly detection

## When to use me

Use this skill when working with Elasticsearch, Kibana, or the ELK stack. Activate when the user mentions elastic, kibana, elk, index, query, dashboard, or log analysis.

## This environment (sofico cluster, via elk MCP)

The `elk` MCP connects to Elasticsearch with a least-privilege read key. Know this before querying:

- **`elk_list_indices` and `elk_get_shards` are FORBIDDEN (403)** — the key lacks `_cat` privileges. Do not call them; they always fail. Discover data with `elk_esql` instead.
- **Prefer `elk_esql`** for everything. `elk_search` also works.
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
