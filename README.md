# DevOps Monitoring Stack

Infrastructure monitoring stack with Prometheus, Grafana dashboards, and alerting rules.

## Features
- **Metrics Collection**: Prometheus time-series data collection
- **Grafana Dashboards**: Pre-built dashboards for infra and app metrics
- **Alerting**: Alertmanager rules with Slack/email notifications
- **Service Health**: Uptime monitoring and SLA tracking
- **Log Aggregation**: Centralized log collection and search
- **Docker Compose**: One-command stack deployment

## Tech Stack
- **Monitoring**: Prometheus, Grafana, Alertmanager
- **Logging**: Loki, Promtail
- **Tracing**: Jaeger
- **Infrastructure**: Docker Compose, Terraform

## Quick Start
```bash
git clone https://github.com/FlourishP/devops-monitoring
cd devops-monitoring
docker-compose up -d
```

## License
MIT — see [LICENSE](LICENSE)
