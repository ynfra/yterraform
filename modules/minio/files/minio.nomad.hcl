job "minio" {
  datacenters = ["shi"]
  type        = "service"

  meta {
    api_url      = "${api_url}"
    admin_url    = "${admin_url}"
    redirect_url = "${redirect_url}"
    version      = "${version}"
    hash         = "${hash}"
  }

  group "minio" {
    count = 1

    network {
      port "admin" { to = 9001 }
      port "api" { to = 9000 }
    }

    volume "minio-data" {
      type            = "csi"
      source          = "minio-data"
      read_only       = false
      attachment_mode = "file-system"
      access_mode     = "single-node-writer"
    }

    task "minio" {
      driver = "docker"

      config {
        image   = "minio/minio:${version}"
        ports   = ["api", "admin"]
        command = "server"
        args    = ["/data", "--console-address", ":9001"]
      }

      resources {
        cpu        = ${resources.cpu}
        memory     = ${resources.memory}
        memory_max = ${resources.memory_max}
      }

      env {
        MINIO_ROOT_USER             = "${root_user}"
        MINIO_ROOT_PASSWORD         = "${root_password}"
        MINIO_DOMAIN                = "${api_url}"
        MINIO_BROWSER_REDIRECT_URL  = "${redirect_url}"
        MINIO_PROMETHEUS_AUTH_TYPE  = "public"
        CONSOLE_SECURE_TLS_REDIRECT = "off"
      }

      volume_mount {
        volume      = "minio-data"
        destination = "/data"
      }

      service {
        name = "$${NOMAD_JOB_NAME}-api"
        port = "api"

        tags = [
          "traefik.enable=true",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-api.entrypoints=http",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-api.rule=Host(`${api_url}`)",
        ]

        check {
          name     = "alive"
          type     = "http"
          path     = "/minio/health/live"
          interval = "10s"
          timeout  = "2s"
        }
      }

      service {
        name = "$${NOMAD_JOB_NAME}-admin"
        port = "admin"

        tags = [
          "traefik.enable=true",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-admin.entrypoints=http",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-admin.rule=Host(`${admin_url}`)",
        ]

        check {
          name     = "alive"
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }

      service {
        name = "$${NOMAD_JOB_NAME}-exporter"
        port = "api"

        check {
          name     = "alive"
          type     = "http"
          path     = "/minio/v2/metrics/cluster"
          interval = "30s"
          timeout  = "2s"
        }
      }
    }

  }
}
