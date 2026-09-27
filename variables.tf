# DevOps Monitoring Infrastructure
# Resources: Prometheus, Grafana, Alertmanager, Node Exporter, cAdvisor, Redis Exporter

variable "region" {
  description = "AWS region for monitoring stack"
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  default     = "production"
}

locals {
  name_prefix = "monitoring-${var.environment}"
}