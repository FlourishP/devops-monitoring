# Terraform configuration for DevOps monitoring infrastructure

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "monitoring" {
  name = "monitoring-net"
  driver = "bridge"
}

resource "docker_image" "prometheus" {
  name = "prom/prometheus:latest"
}

resource "docker_container" "prometheus" {
  name  = "prometheus"
  image = docker_image.prometheus.image_id
  ports = ["9090:9090"]
  networks_advanced = [
    {
      name = docker_network.monitoring.name
    }
  ]
  volumes = [
    "${path.module}/prometheus.yml:/etc/prometheus/prometheus.yml:ro",
    "promdata:/prometheus"
  ]
}

resource "docker_image" "grafana" {
  name = "grafana/grafana:latest"
}

resource "docker_container" "grafana" {
  name  = "grafana"
  image = docker_image.grafana.image_id
  ports = ["3000:3000"]
  networks_advanced = [
    {
      name = docker_network.monitoring.name
    }
  ]
  env = [
    "GF_SECURITY_ADMIN_USER=admin",
    "GF_SECURITY_ADMIN_PASSWORD=changeme"
  ]
}

resource "docker_image" "node_exporter" {
  name = "prom/node-exporter:latest"
}

resource "docker_container" "node_exporter" {
  name  = "node-exporter"
  image = docker_image.node_exporter.image_id
  ports = ["9100:9100"]
  networks_advanced = [
    {
      name = docker_network.monitoring.name
    }
  ]
  volumes = ["/proc:/host/proc:ro", "/sys:/host/sys:ro", "/:/rootfs:ro"]
}

volume "promdata" {}