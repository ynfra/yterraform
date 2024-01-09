job "uptime" {
  datacenters = ["shi"]
  type        = "service"
  meta {
    url     = "${url}"
    version = "${version}"
    hash    = "${hash}"
  }

  group "uptime" {
    count = 1

    network {
      port "app" {
        to = 3001
      }
    }

    task "app" {
      driver = "docker"

      config {
        image = "dockette/kumatron:${version}"
        ports = ["app"]
      }

      resources {
        cpu    = 1000
        memory = 2048
      }

      env {
        LITESTREAM                      = "1"
        LITESTREAM_TEMPLATE             = "s3"
        LITESTREAM_DB_FILE              = "/app/data/kuma.db"
        LITESTREAM_S3_BUCKET            = "${s3_bucket}"
        LITESTREAM_S3_PATH              = "${s3_path}"
        LITESTREAM_S3_REGION            = "${s3_region}"
        LITESTREAM_S3_ENDPOINT          = "${s3_endpoint}"
        LITESTREAM_S3_ACCESS_KEY_ID     = "${s3_access_key_id}"
        LITESTREAM_S3_SECRET_ACCESS_KEY = "${s3_secret_access_key}"
      }

      service {
        name = "$${NOMAD_JOB_NAME}"
        port = "app"
        tags = [
          "traefik.enable=true",
          "traefik.http.routers.$${NOMAD_JOB_NAME}.entrypoints=http",
          "traefik.http.routers.$${NOMAD_JOB_NAME}.rule=Host(`${url}`)",
        ]

        check {
          type     = "http"
          path     = "/"
          interval = "30s"
          timeout  = "5s"
        }
      }
    }
  }

}
