job "metabase" {
  type        = "service"
  datacenters = ["shi"]

  update {
    canary       = 1
    max_parallel = 1
    health_check = "checks"
    auto_revert  = true
    auto_promote = true
  }

  meta {
    url     = "${url}"
    version = "${version}"
    hash    = "${hash}"
  }

  group "metabase" {
    count = 1

    network {
      port "http" {
        to = 3000
      }
    }

    task "metabase" {
      env {
        JAVA_TIMEZONE          = "${metabase_timezone}"
        MB_PASSWORD_COMPLEXITY = "${metabase_password_complexity}"
        MB_PASSWORD_LENGTH     = "${metabase_password_length}"
        MB_DB_TYPE             = "${metabase_db_type}"
        MB_DB_DBNAME           = "${metabase_db_dbname}"
        MB_DB_PORT             = "${metabase_db_port}"
        MB_DB_USER             = "${metabase_db_user}"
        MB_DB_PASS             = "${metabase_db_pass}"
        MB_DB_HOST             = "${metabase_db_host}"
      }

      driver = "docker"

      config {
        image = "metabase/metabase:${version}"
        ports = ["http"]
      }

      resources {
        cpu    = 4000
        memory = 2048
      }
    }

    service {
      name = "metabase"
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
        timeout  = "5s"
      }
    }
  }
}
