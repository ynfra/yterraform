job "corsanywhere" {
  type        = "service"
  datacenters = ["shi"]

  meta {
    url = "${url}"
  }

  group "corsanywhere" {
    count = 1

    network {
      port "corsanywhere" {
        to = 8080
      }
    }

    task "corsanywhere" {
      driver = "docker"

      config {
        image = "testcab/cors-anywhere:latest"
        ports = ["corsanywhere"]
      }

      service {
        name = "corsanywhere"
        port = "corsanywhere"

        tags = [
          "traefik.enable=true",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.rule=Host(`${url}`)"
        ]

        check {
          name     = "alive"
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
