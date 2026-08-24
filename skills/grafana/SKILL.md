---
name: grafana
description: Grafana dashboard design, panel configuration, alerting, and datasource management
compatibility: opencode
---

## What I do

- Design and create Grafana dashboards with effective panel layouts
- Configure Prometheus, Elasticsearch, and other datasource queries
- Set up alerting rules and notification channels
- Use variables for dynamic dashboards
- Create reusable dashboard templates

## When to use me

Use this skill when working with Grafana dashboards, panels, alerts, or datasource configuration. Activate when the user mentions grafana, dashboard, panel, alert, or visualization.

## Patterns

### Dashboard structure
```yaml
Dashboard:
  Title: Descriptive Name
  Tags: [category, environment]
  Templating:
    - Variable: environment
      Type: custom
      Values: prod, staging, dev
    - Variable: host
      Type: query
      Query: label_values(cpu_usage, host)
  Panels:
    - Row: Overview
    - Stat: Current value
    - Time series: Trends over time
    - Table: Detailed data
    - Heatmap: Distribution
```

### Prometheus query patterns
```promql
# Rate of requests
rate(http_requests_total[5m])

# Error rate percentage
rate(http_requests_total{status=~"5.."}[5m]) / rate(http_requests_total[5m]) * 100

# Quantile latency
histogram_quantile(0.99, rate(http_request_duration_seconds_bucket[5m]))

# Top 5 by CPU
topk(5, rate(process_cpu_seconds_total[5m]))

# Memory usage percentage
(node_memory_MemTotal - node_memory_MemAvailable) / node_memory_MemTotal * 100
```

### Panel types
- **Stat**: Single value with color threshold
- **Time series**: Lines/areas over time (most common)
- **Table**: Multi-dimensional data
- **Heatmap**: Distribution over time
- **Gauge**: Value with min/max range
- **Bar gauge**: Horizontal/vertical bars

### Alert rules
```yaml
# Prometheus alerting rule
groups:
  - name: application
    rules:
      - alert: HighErrorRate
        expr: rate(http_requests_total{status=~"5.."}[5m]) > 0.05
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "High error rate on {{ $labels.instance }}"
          description: "Error rate is {{ $value | humanizePercentage }}"
```

### Best practices
- Use variables for reusability ($environment, $host, $service)
- Group related panels in rows
- Use consistent color schemes across panels
- Set appropriate time ranges and auto-refresh intervals
- Use annotations for deployments/incidents
- Link dashboards to related dashboards
- Use snapshot for sharing outside the org
