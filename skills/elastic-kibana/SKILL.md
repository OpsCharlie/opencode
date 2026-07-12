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
