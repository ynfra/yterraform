job "redoc" {
  type        = "service"
  datacenters = ["shi"]

  meta {
    url     = "${url}"
    version = "${version}"
  }

  group "redoc" {
    count = 1

    network {
      port "redoc" { to = 8000 }
    }

    task "redoc" {
      driver = "docker"

      config {
        image = "dockette/redoc:${version}"
        ports = ["redoc"]
      }

      resources {
        cpu    = 128
        memory = 128
      }

      service {
        name = "[[.deploy_service]]"
        port = "redoc"

        tags = [
          "traefik.enable=true",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.entrypoints=http",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.rule=Host(`${url}`)",
        ]

        check {
          name     = "alive"
          type     = "http"
          path     = "/"
          interval = "30s"
          timeout  = "5s"
        }
      }
    }
  }
}
