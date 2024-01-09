job "[[.deploy_service]]" {
  type        = "service"
  datacenters = ["shi"]

  constraint {
    attribute = "${attr.unique.hostname}"
    operator  = "="
    value     = "shi-nmd2"
  }

  meta {
    deploy_hash    = "[[.deploy_hash]]"
    deploy_host    = "[[.deploy_host]]"
    deploy_service = "[[.deploy_service]]"
  }

  update {
    min_healthy_time  = "10s"
    healthy_deadline  = "10m"
    progress_deadline = "15m"
  }

  group "retool" {
    count = 1

    network {
      port "api" { to = 3000 }
      port "postgres1" { to = 5432 }
      port "postgres2" { to = 5432 }
      port "db_connector" { to = 3002 }
      port "db_ssh_connector" { to = 3002 }
    }

    volume "[[.deploy_service]]-db1" {
      type            = "csi"
      source          = "[[.deploy_service]]-db1"
      read_only       = false
      attachment_mode = "file-system"
      access_mode     = "single-node-writer"
    }

    volume "[[.deploy_service]]-db2" {
      type            = "csi"
      source          = "[[.deploy_service]]-db2"
      read_only       = false
      attachment_mode = "file-system"
      access_mode     = "single-node-writer"
    }

    task "api" {
      driver = "docker"

      config {
        image   = "tryretool/backend:2.115.2"
        ports   = ["api"]
        command = "./docker_scripts/start_api.sh"
      }

      resources {
        cpu    = 2000
        memory = 3072
      }

      env {
        SERVICE_TYPE          = "MAIN_BACKEND"
        DB_CONNECTOR_HOST     = "http://${NOMAD_HOST_IP_db_connector}"
        DB_CONNECTOR_PORT     = "${NOMAD_HOST_PORT_db_connector}"
        DB_SSH_CONNECTOR_HOST = "http://${NOMAD_HOST_IP_db_ssh_connector}"
        DB_SSH_CONNECTOR_PORT = "${NOMAD_HOST_PORT_db_ssh_connector}"

        NODE_ENV   = "[[.retool_node_env]]"
        JWT_SECRET = "[[.retool_jwt_secret]]"

        POSTGRES_DB       = "[[.postgres1_db]]"
        POSTGRES_USER     = "[[.postgres1_user]]"
        POSTGRES_HOST     = "${NOMAD_HOST_IP_postgres1}"
        POSTGRES_PORT     = "${NOMAD_HOST_PORT_postgres1}"
        POSTGRES_PASSWORD = "[[.postgres1_password]]"

        RETOOLDB_POSTGRES_DB       = "[[.postgres2_db]]"
        RETOOLDB_POSTGRES_USER     = "[[.postgres2_user]]"
        RETOOLDB_POSTGRES_HOST     = "${NOMAD_HOST_IP_postgres2}"
        RETOOLDB_POSTGRES_PORT     = "${NOMAD_HOST_PORT_postgres2}"
        RETOOLDB_POSTGRES_PASSWORD = "[[.postgres2_password]]"

        DOMAINS             = "${attr.unique.network.ip-address} -> http://${NOMAD_ADDR_api}"
        ENCRYPTION_KEY      = "[[.retool_encryption_key]]"
        BASE_DOMAIN         = "[[.deploy_host]]"
        LICENSE_KEY         = "[[.retool_license_key]]"
        COOKIE_INSECURE     = "[[.retool_cookie_insecure]]"
        DISABLE_GIT_SYNCING = true
      }

      service {
        name = "[[.deploy_service]]-api"
        port = "api"

        tags = [
          "traefik.enable=true",
          "traefik.http.routers.[[.deploy_service]]-http.entrypoints=http",
          "traefik.http.routers.[[.deploy_service]]-http.rule=Host(`[[.deploy_host]]`)",
        ]

        check {
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }

    task "jobs-runner" {
      driver = "docker"

      config {
        image   = "tryretool/backend:2.115.2"
        command = "./docker_scripts/start_api.sh"
      }

      resources {
        cpu    = 2000
        memory = 2048
      }

      env {
        SERVICE_TYPE = "JOBS_RUNNER"

        NODE_ENV   = "[[.retool_node_env]]"
        JWT_SECRET = "[[.retool_jwt_secret]]"

        POSTGRES_DB       = "[[.postgres1_db]]"
        POSTGRES_USER     = "[[.postgres1_user]]"
        POSTGRES_HOST     = "${NOMAD_HOST_IP_postgres1}"
        POSTGRES_PORT     = "${NOMAD_HOST_PORT_postgres1}"
        POSTGRES_PASSWORD = "[[.postgres1_password]]"

        RETOOLDB_POSTGRES_DB       = "[[.postgres2_db]]"
        RETOOLDB_POSTGRES_USER     = "[[.postgres2_user]]"
        RETOOLDB_POSTGRES_HOST     = "${NOMAD_HOST_IP_postgres2}"
        RETOOLDB_POSTGRES_PORT     = "${NOMAD_HOST_PORT_postgres2}"
        RETOOLDB_POSTGRES_PASSWORD = "[[.postgres2_password]]"

        DOMAINS             = "${attr.unique.network.ip-address} -> http://${NOMAD_ADDR_api}"
        ENCRYPTION_KEY      = "[[.retool_encryption_key]]"
        BASE_DOMAIN         = "[[.deploy_host]]"
        LICENSE_KEY         = "[[.retool_license_key]]"
        COOKIE_INSECURE     = "[[.retool_cookie_insecure]]"
        DISABLE_GIT_SYNCING = true
      }
    }

    task "db-connector" {
      driver = "docker"

      config {
        image   = "tryretool/backend:2.115.2"
        ports   = ["db_connector"]
        command = "./retool_backend"
      }

      resources {
        cpu    = 1000
        memory = 1024
      }

      env {
        SERVICE_TYPE = "DB_CONNECTOR_SERVICE"

        NODE_ENV   = "[[.retool_node_env]]"
        JWT_SECRET = "[[.retool_jwt_secret]]"

        POSTGRES_DB       = "[[.postgres1_db]]"
        POSTGRES_USER     = "[[.postgres1_user]]"
        POSTGRES_HOST     = "${NOMAD_HOST_IP_postgres1}"
        POSTGRES_PORT     = "${NOMAD_HOST_PORT_postgres1}"
        POSTGRES_PASSWORD = "[[.postgres1_password]]"

        RETOOLDB_POSTGRES_DB       = "[[.postgres2_db]]"
        RETOOLDB_POSTGRES_USER     = "[[.postgres2_user]]"
        RETOOLDB_POSTGRES_HOST     = "${NOMAD_HOST_IP_postgres2}"
        RETOOLDB_POSTGRES_PORT     = "${NOMAD_HOST_PORT_postgres2}"
        RETOOLDB_POSTGRES_PASSWORD = "[[.postgres2_password]]"

        DOMAINS             = "${attr.unique.network.ip-address} -> http://${NOMAD_ADDR_api}"
        ENCRYPTION_KEY      = "[[.retool_encryption_key]]"
        BASE_DOMAIN         = "[[.deploy_host]]"
        LICENSE_KEY         = "[[.retool_license_key]]"
        COOKIE_INSECURE     = "[[.retool_cookie_insecure]]"
        DISABLE_GIT_SYNCING = true
      }

      service {
        name = "[[.deploy_service]]-db-connector"
        port = "db_connector"

        check {
          type     = "tcp"
          interval = "30s"
          timeout  = "5s"
        }
      }
    }

    task "db-ssh-connector" {
      driver = "docker"

      config {
        image   = "tryretool/backend:2.115.2"
        ports   = ["db_ssh_connector"]
        command = "./retool_backend"
      }

      resources {
        cpu    = 1000
        memory = 1024
      }

      env {
        SERVICE_TYPE = "DB_SSH_CONNECTOR_SERVICE"

        NODE_ENV   = "[[.retool_node_env]]"
        JWT_SECRET = "[[.retool_jwt_secret]]"

        POSTGRES_DB       = "[[.postgres1_db]]"
        POSTGRES_USER     = "[[.postgres1_user]]"
        POSTGRES_HOST     = "${NOMAD_HOST_IP_postgres1}"
        POSTGRES_PORT     = "${NOMAD_HOST_PORT_postgres1}"
        POSTGRES_PASSWORD = "[[.postgres1_password]]"

        RETOOLDB_POSTGRES_DB       = "[[.postgres2_db]]"
        RETOOLDB_POSTGRES_USER     = "[[.postgres2_user]]"
        RETOOLDB_POSTGRES_HOST     = "${NOMAD_HOST_IP_postgres2}"
        RETOOLDB_POSTGRES_PORT     = "${NOMAD_HOST_PORT_postgres2}"
        RETOOLDB_POSTGRES_PASSWORD = "[[.postgres2_password]]"

        DOMAINS             = "${attr.unique.network.ip-address} -> http://${NOMAD_ADDR_api}"
        ENCRYPTION_KEY      = "[[.retool_encryption_key]]"
        BASE_DOMAIN         = "[[.deploy_host]]"
        LICENSE_KEY         = "[[.retool_license_key]]"
        COOKIE_INSECURE     = "[[.retool_cookie_insecure]]"
        DISABLE_GIT_SYNCING = true
      }

      service {
        name = "[[.deploy_service]]-db-ssh-connector"
        port = "db_ssh_connector"

        check {
          type     = "tcp"
          interval = "30s"
          timeout  = "5s"
        }
      }
    }

    task "postgres1" {
      driver = "docker"

      config {
        image = "postgres:11.13"
        ports = ["postgres1"]
      }

      resources {
        cpu    = 1000
        memory = 1024
      }

      lifecycle {
        hook    = "prestart"
        sidecar = true
      }

      env {
        POSTGRES_USER     = "[[.postgres1_user]]"
        POSTGRES_PASSWORD = "[[.postgres1_password]]"
        POSTGRES_DB       = "[[.postgres1_db]]"
      }

      volume_mount {
        volume      = "[[.deploy_service]]-db1"
        destination = "/var/lib/postgresql/data"
      }

      service {
        check {
          type    = "script"
          command = "pg_isready"
          args    = [
            "-q", "-d", "[[.postgres1_db]]", "-U", "[[.postgres1_user]]"
          ]
          interval = "10s"
          timeout  = "5s"
        }
      }
    }

    task "postgres2" {
      driver = "docker"

      config {
        image = "postgres:14.3"
        ports = ["postgres2"]
      }

      resources {
        cpu    = 1000
        memory = 1024
      }

      lifecycle {
        hook    = "prestart"
        sidecar = true
      }

      env {
        POSTGRES_USER     = "[[.postgres2_user]]"
        POSTGRES_PASSWORD = "[[.postgres2_password]]"
        POSTGRES_DB       = "[[.postgres2_db]]"
      }

      volume_mount {
        volume      = "[[.deploy_service]]-db2"
        destination = "/var/lib/postgresql/data"
      }

      service {
        check {
          type    = "script"
          command = "pg_isready"
          args    = [
            "-q", "-d", "[[.postgres2_db]]", "-U", "[[.postgres2_user]]"
          ]
          interval = "10s"
          timeout  = "5s"
        }
      }
    }
  }
}
