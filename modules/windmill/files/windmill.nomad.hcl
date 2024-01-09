job "windmill" {
  type        = "service"
  datacenters = ["shi"]

  meta {
    url     = "${url}"
    version = "${version}"
    hash    = "${hash}"
  }

  group "windmill" {
    count = 1

    network {
      port "server" { to = 8000 }
      port "lsp" { to = 3001 }
      port "postgres" { to = 5432 }
    }

    volume "windmill_db" {
      type            = "csi"
      source          = "windmill_db"
      read_only       = false
      attachment_mode = "file-system"
      access_mode     = "single-node-writer"
    }

    task "server" {
      driver = "docker"

      config {
        image      = "ghcr.io/windmill-labs/windmill:${version}"
        force_pull = true
        ports      = ["server"]
      }

      resources {
        cpu    = 2000
        memory = 2048
      }

      env {
        DATABASE_URL       = "postgres://${db_user}:${db_password}@$${NOMAD_HOST_IP_postgres}:$${NOMAD_HOST_PORT_postgres}/${db_db}?sslmode=disable"
        BASE_URL           = "${url}"
        RUST_LOG           = "info"
        NUM_WORKERS        = "0"
        DISABLE_SERVER     = false
        METRICS_ADDR       = false
        REQUEST_SIZE_LIMIT = "${request_limit}"
        SMTP_FROM          = "${smtp_from}"
        SMTP_HOST          = "${smtp_host}"
        SMTP_PORT          = "${smtp_port}"
        SMTP_USERNAME      = "${smtp_username}"
        SMTP_PASSWORD      = "${smtp_password}"
      }

      service {
        name = "$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}"
        port = "server"

        tags = [
          "traefik.enable=true",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.entrypoints=http",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.rule=Host(`${url}`)",
        ]

        check {
          type     = "http"
          path     = "/"
          interval = "30s"
          timeout  = "5s"
        }
      }
    }

    task "worker1" {
      driver = "docker"

      config {
        image      = "ghcr.io/windmill-labs/windmill:${version}"
        force_pull = true
        volumes    = [
          "/var/run/docker.sock:/var/run/docker.sock"
        ]
      }

      restart {
        attempts = 5
        delay    = "30s"
      }

      resources {
        cpu    = 1000
        memory = 2048
      }

      env {
        DATABASE_URL       = "postgres://${db_user}:${db_password}@$${NOMAD_HOST_IP_postgres}:$${NOMAD_HOST_PORT_postgres}/${db_db}?sslmode=disable"
        BASE_URL           = "https://${url}"
        RUST_LOG           = "info"
        DISABLE_SERVER     = true
        KEEP_JOB_DIR       = false
        METRICS_ADDR       = false
        REQUEST_SIZE_LIMIT = "${request_limit}"
        SMTP_FROM          = "${smtp_from}"
        SMTP_HOST          = "${smtp_host}"
        SMTP_PORT          = "${smtp_port}"
        SMTP_USERNAME      = "${smtp_username}"
        SMTP_PASSWORD      = "${smtp_password}"
      }
    }

    task "worker2" {
      driver = "docker"

      config {
        image      = "ghcr.io/windmill-labs/windmill:${version}"
        force_pull = true
        volumes    = [
          "/var/run/docker.sock:/var/run/docker.sock"
        ]
      }

      resources {
        cpu    = 1000
        memory = 2048
      }

      env {
        DATABASE_URL       = "postgres://${db_user}:${db_password}@$${NOMAD_HOST_IP_postgres}:$${NOMAD_HOST_PORT_postgres}/${db_db}?sslmode=disable"
        BASE_URL           = "https://${url}"
        RUST_LOG           = "info"
        DISABLE_SERVER     = true
        KEEP_JOB_DIR       = false
        METRICS_ADDR       = false
        REQUEST_SIZE_LIMIT = "${request_limit}"
        SMTP_FROM          = "${smtp_from}"
        SMTP_HOST          = "${smtp_host}"
        SMTP_PORT          = "${smtp_port}"
        SMTP_USERNAME      = "${smtp_username}"
        SMTP_PASSWORD      = "${smtp_password}"
      }
    }


    task "lsp" {
      driver = "docker"

      config {
        image      = "ghcr.io/windmill-labs/windmill-lsp:${version}"
        force_pull = true
        ports      = ["lsp"]
      }

      resources {
        cpu    = 500
        memory = 512
      }

      service {
        name = "$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}"
        port = "lsp"

        tags = [
          "traefik.enable=true",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.entrypoints=http",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.rule=Host(`${url}`) && PathPrefix(`/ws`)",
        ]

        check {
          type     = "http"
          path     = "/"
          interval = "60s"
          timeout  = "5s"
        }
      }
    }

    task "postgres" {
      driver = "docker"

      config {
        image = "postgres:14"
        ports = ["postgres"]
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
        POSTGRES_PASSWORD = "${db_password}"
        POSTGRES_DB       = "${db_db}"
      }

      volume_mount {
        volume      = "windmill_db"
        destination = "/var/lib/postgresql/data"
      }

      service {
        check {
          type    = "script"
          command = "pg_isready"
          args    = [
            "-q", "-U", "${db_user}"
          ]
          interval = "10s"
          timeout  = "5s"
        }
      }
    }

  }
}
