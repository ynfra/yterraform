job "adminer" {
  datacenters = ["shi"]
  type        = "service"

  meta {
    url     = "${url}"
    version = "${version}"
    hash    = "${hash}"
  }

  group "adminer" {
    count = 1

    network {
      port "adminer" { to = 8080 }
    }

    task "adminer" {
      driver = "docker"

      config {
        image = "adminer:${version}"
        ports = ["adminer"]
      }

      resources {
        cpu        = 100
        memory     = 64
        memory_max = 512
      }

      service {
        name = "$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}"
        port = "adminer"

        tags = [
          "traefik.enable=true",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.entrypoints=http",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.rule=Host(`${url}`)",
        ]

        check {
          type     = "http"
          path     = "/"
          interval = "30s"
          timeout  = "2s"
        }
      }
    }

  }
}
