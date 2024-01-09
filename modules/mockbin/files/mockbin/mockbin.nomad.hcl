job "mockbin" {
  type        = "service"
  datacenters = ["shi"]

  meta {
    url     = "${url}"
    version = "${version}"
  }

  group "mockbin" {
    count = 1

    network {
      port "mockbin" {
        to = 8000
      }
      port "redis" {
        to = 6379
      }
    }

    service {
      name = "mockbin"
      port = "mockbin"

      tags = [
        "traefik.enable=true",
        "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.entrypoints=http",
        "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.rule=Host(`${url}`)",
      ]

      check {
        type     = "http"
        path     = "/"
        interval = "30s"
        timeout  = "5s"
      }
    }

    task "mockbin" {
      driver = "docker"

      config {
        image = "dockette/mockbin:${version}"
        ports = ["mockbin"]
      }

      env {
        MOCKBIN_REDIS = "redis://$${NOMAD_HOST_IP_redis}:$${NOMAD_HOST_PORT_redis}"
      }

      resources {
        cpu    = 200
        memory = 256
      }
    }

    task "redis" {
      driver = "docker"

      config {
        image = "redis"
        ports = ["redis"]
      }

      resources {
        cpu    = 200
        memory = 256
      }
    }
  }
}
