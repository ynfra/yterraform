job "echo" {
  type        = "service"
  datacenters = ["shi"]

  meta {
    url     = "${url}"
    version = "${version}"
    hash    = "${hash}"
  }

  group "echo" {
    count = 2

    network {
      port "http" {}
    }

    task "server" {
      driver = "docker"

      config {
        image = "hashicorp/demo-webapp-lb-guide:${version}"
        ports = ["http"]
      }

      env {
        PORT    = "$${NOMAD_PORT_http}"
        NODE_IP = "$${NOMAD_IP_http}"
      }

      service {
        name = "$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}"
        port = "http"

        tags = [
          "traefik.enable=true",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.entrypoints=http",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.rule=Host(`${url}`)",
        ]

        check {
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
