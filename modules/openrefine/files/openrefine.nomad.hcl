job "openrefine" {
  datacenters = ["shi"]
  type        = "service"

  meta {
    url     = "${url}"
    version = "${version}"
    hash    = "${hash}"
  }

  group "openrefine" {
    count = 1

    network {
      port "openrefine" { to = 3333 }
    }

    task "openrefine" {
      driver = "docker"

      config {
        image = "ghcr.io/ninanor/openrefine:${version}"
        ports = ["openrefine"]
      }

      resources {
        cpu        = 2000
        memory     = 2048
        memory_max = 4096
      }

      service {
        name = "$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}"
        port = "openrefine"

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
