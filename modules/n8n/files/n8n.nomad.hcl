job "n8n" {
  type        = "service"
  datacenters = ["shi"]

  meta {
    url     = "${url}"
    version = "${version}"
    hash    = "${hash}"
  }

  group "n8n" {
    count = 1

    network {
      port "web" { to = 5678 }
      port "redis" { to = 6379 }
      port "db" { to = 5432 }
    }

    volume "n8n-data" {
      type            = "csi"
      source          = "n8n-data"
      read_only       = false
      attachment_mode = "file-system"
      access_mode     = "multi-node-multi-writer"
    }

    volume "n8n-db" {
      type            = "csi"
      source          = "n8n-db"
      read_only       = false
      attachment_mode = "file-system"
      access_mode     = "single-node-writer"
    }

    task "redis" {
      driver = "docker"

      config {
        image = "redis:6-alpine"
        ports = ["redis"]
      }

      resources {
        cpu    = 200
        memory = 512
      }

      lifecycle {
        hook    = "prestart"
        sidecar = true
      }

      service {
        name = "n8n-redis"
        port = "redis"
        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }

    task "postgres" {
      driver = "docker"

      config {
        image = "postgres:11"
        ports = ["db"]
      }

      resources {
        cpu    = 500
        memory = 512
      }

      lifecycle {
        hook    = "prestart"
        sidecar = true
      }

      env {
        POSTGRES_USER     = "${db_user}"
        POSTGRES_PASSWORD = "${db_password}"
        POSTGRES_DB       = "${db_dbname}"
      }

      volume_mount {
        volume      = "n8n-db"
        destination = "/var/lib/postgresql/data"
      }

      service {
        name = "$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}"

        check {
          type     = "script"
          command  = "pg_isready"
          args     = ["-q", "-d", "[[.postgres_db]]", "-U", "[[.postgres_user]]"]
          interval = "10s"
          timeout  = "5s"
        }
      }
    }

    task "init" {
      driver = "docker"
      user   = "root"

      config {
        image      = "n8nio/base:16"
        entrypoint = ["chown"]
        args       = ["-R", "node:node", "/home/node/.n8n"]
      }

      resources {
        cpu    = 100
        memory = 128
      }

      lifecycle {
        hook = "prestart"
      }

      volume_mount {
        volume      = "n8n-data"
        destination = "/home/node/.n8n"
      }
    }

    task "web" {
      driver = "docker"

      config {
        image = "n8nio/n8n:${version}"
        ports = ["web"]
      }

      resources {
        cpu    = 2000
        memory = 2048
      }

      env {
        DB_TYPE                           = "postgresdb"
        DB_POSTGRESDB_HOST                = "$${NOMAD_HOST_IP_db}"
        DB_POSTGRESDB_PORT                = "$${NOMAD_HOST_PORT_db}"
        DB_POSTGRESDB_USER                = "${db_user}"
        DB_POSTGRESDB_PASSWORD            = "${db_password}"
        DB_POSTGRESDB_DATABASE            = "${db_dbname}"
        EXECUTIONS_MODE                   = "queue"
        QUEUE_BULL_REDIS_HOST             = "$${NOMAD_HOST_IP_redis}"
        QUEUE_BULL_REDIS_PORT             = "$${NOMAD_HOST_PORT_redis}"
        QUEUE_HEALTH_CHECK_ACTIVE         = true
        N8N_LOG_LEVEL                     = "debug"
        N8N_DIAGNOSTICS_ENABLED           = false
        N8N_HIRING_BANNER_ENABLED         = false
        N8N_VERSION_NOTIFICATIONS_ENABLED = false
        N8N_METRICS                       = true
        N8N_TEMPLATES_ENABLED             = true
        GENERIC_TIMEZONE                  = "Europe/Prague"
        N8N_EDITOR_BASE_URL               = "${url}"
        N8N_HOST                          = "${url}"
        WEBHOOK_URL                       = "${url}"
        N8N_ENCRYPTION_KEY                = "${encryption_key}"
        N8N_BASIC_AUTH_ACTIVE             = "${basic_auth_enabled}"
        N8N_BASIC_AUTH_USER               = "${basic_auth_user}"
        N8N_BASIC_AUTH_PASSWORD           = "${basic_auth_password}"
      }

      volume_mount {
        volume      = "n8n-data"
        destination = "/home/node/.n8n"
      }

      service {
        name = "$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}"
        port = "web"

        tags = [
          "traefik.enable=true",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-api.entrypoints=http",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-api.rule=Host(`${url}`)",
        ]

        check {
          name     = "alive"
          type     = "http"
          path     = "/healthz"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }

    task "worker" {
      driver = "docker"

      config {
        image   = "n8nio/n8n:${version}"
        command = "worker"
      }

      resources {
        cpu    = 2000
        memory = 2048
      }

      lifecycle {
        hook    = "poststart"
        sidecar = true
      }

      env {
        DB_TYPE                           = "postgresdb"
        DB_POSTGRESDB_HOST                = "$${NOMAD_HOST_IP_db}"
        DB_POSTGRESDB_PORT                = "$${NOMAD_HOST_PORT_db}"
        DB_POSTGRESDB_USER                = "${db_user}"
        DB_POSTGRESDB_PASSWORD            = "${db_password}"
        DB_POSTGRESDB_DATABASE            = "${db_dbname}"
        EXECUTIONS_MODE                   = "queue"
        QUEUE_BULL_REDIS_HOST             = "$${NOMAD_HOST_IP_redis}"
        QUEUE_BULL_REDIS_PORT             = "$${NOMAD_HOST_PORT_redis}"
        QUEUE_HEALTH_CHECK_ACTIVE         = true
        N8N_LOG_LEVEL                     = "debug"
        N8N_DIAGNOSTICS_ENABLED           = false
        N8N_HIRING_BANNER_ENABLED         = false
        N8N_VERSION_NOTIFICATIONS_ENABLED = false
        GENERIC_TIMEZONE                  = "Europe/Prague"
        N8N_EDITOR_BASE_URL               = "${url}"
        N8N_HOST                          = "${url}"
        N8N_ENCRYPTION_KEY                = "${encryption_key}"
        N8N_BASIC_AUTH_ACTIVE             = "${basic_auth_enabled}"
        N8N_BASIC_AUTH_USER               = "${basic_auth_user}"
        N8N_BASIC_AUTH_PASSWORD           = "${basic_auth_password}"
      }

      volume_mount {
        volume      = "n8n-data"
        destination = "/home/node/.n8n"
      }
    }

  }
}
