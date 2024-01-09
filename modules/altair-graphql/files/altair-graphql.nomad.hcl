job "graphql" {
  datacenters = ["shi"]

  meta {
    url     = "${url}"
    version = "${version}"
    hash    = "${hash}"
  }

  group "graphql" {
    count = 1

    network {
      port "http" { to = 3000 }
    }

    task "web" {
      driver = "docker"
      config {
        image = "limebeck/altair-docker:${version}"
        ports = ["http"]
      }
    }

    service {
      name = "graphql"

      tags = [
        "traefik.enable=true",
        "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.entrypoints=http",
        "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.rule=Host(`${url}`)",
      ]

      port = "http"
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
