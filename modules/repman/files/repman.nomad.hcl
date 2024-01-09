job "repman" {
  type        = "service"
  datacenters = ["shi"]

  meta {
    url     = "${url}"
    version = "${version}"
    hash    = "${hash}"
  }

  group "repman" {
    count = 1

    network {
      port "web" { to = 80 }
      port "db" { to = 5432 }
    }

    volume "repman-db" {
      type            = "csi"
      source          = "repman-db"
      read_only       = false
      attachment_mode = "file-system"
      access_mode     = "single-node-writer"
    }

    task "web" {
      driver = "docker"

      config {
        image      = "dockette/repman:${version}"
        ports      = ["web"]
        command    = "/entrypoint-app.sh"
        force_pull = true
      }

      resources {
        cpu        = 500
        memory     = 512
        memory_max = 2048
      }

      env {
        APP_HOST                   = "${url}"
        APP_DOMAIN_SEPARATOR       = "-"
        APP_ORGANIZATION_SEPARATOR = "-"
        APP_ENV                    = "prod"
        APP_DEBUG                  = "0"
        TRUSTED_PROXIES            = "${app_trusted_proxies}"
        #TRUSTED_HOSTS              = "^yourapp.dev$"
        DATABASE_URL               = "postgresql://${db_user}:${db_password}@$${NOMAD_HOST_IP_db}:$${NOMAD_HOST_PORT_db}/${db_dbname}?serverVersion=11&charset=utf8"
        #OAUTH_GITHUB_CLIENT_ID     = "[[.app_github_client_id]]"
        #OAUTH_GITHUB_CLIENT_SECRET = "[[.app_github_client_secret]]"
        PROXY_DIST_DIR             = "var/proxy"
        PACKAGES_DIST_DIR          = "var/repo"
        STORAGE_SOURCE             = "storage.s3"
        STORAGE_AWS_BUCKET         = "${app_s3_bucket}"
        STORAGE_AWS_REGION         = "${app_s3_region}"
        STORAGE_AWS_OPAQUE_AUTH    = "true"
        STORAGE_AWS_KEY            = "${app_s3_key}"
        STORAGE_AWS_SECRET         = "${app_s3_secret}"
        STORAGE_AWS_ENDPOINT       = "${app_s3_endpoint}"
        MAILER_DSN                 = "${app_mailer_dsn}"
        MAILER_SENDER              = "${app_mailer_sender}"
        APP_GITLAB_API_URL         = "${app_gitlab_api_url}"
        OAUTH_GITLAB_CLIENT_ID     = "${app_gitlab_client_id}"
        OAUTH_GITLAB_CLIENT_SECRET = "${app_gitlab_client_secret}"
      }

      service {
        name = "$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}"
        port = "web"

        tags = [
          "traefik.enable=true",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-api.entrypoints=http",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-api.rule=Host(`${url}`) || Host(`repo-${url}`) || Host(`${prefix}-repo-${url}`)",
        ]

        check {
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "5s"
        }
      }
    }

    task "consumer" {
      driver = "docker"

      config {
        image      = "dockette/repman:1.4.0"
        command    = "/entrypoint-consumer.sh"
        force_pull = true
      }

      resources {
        cpu        = 1000
        memory     = 1024
        memory_max = 4096
      }

      env {
        APP_HOST                   = "${url}"
        APP_DOMAIN_SEPARATOR       = "-"
        APP_ORGANIZATION_SEPARATOR = "-"
        DATABASE_URL               = "postgresql://${db_user}:${db_password}@$${NOMAD_HOST_IP_db}:$${NOMAD_HOST_PORT_db}/${db_dbname}?serverVersion=11&charset=utf8"
        #OAUTH_GITHUB_CLIENT_ID     = "[[.app_github_client_id]]"
        #OAUTH_GITHUB_CLIENT_SECRET = "[[.app_github_client_secret]]"
        PROXY_DIST_DIR             = "var/proxy"
        PACKAGES_DIST_DIR          = "var/repo"
        STORAGE_SOURCE             = "storage.s3"
        STORAGE_AWS_BUCKET         = "${app_s3_bucket}"
        STORAGE_AWS_REGION         = "${app_s3_region}"
        STORAGE_AWS_OPAQUE_AUTH    = "true"
        STORAGE_AWS_KEY            = "${app_s3_key}"
        STORAGE_AWS_SECRET         = "${app_s3_secret}"
        STORAGE_AWS_ENDPOINT       = "${app_s3_endpoint}"
        MAILER_DSN                 = "${app_mailer_dsn}"
        MAILER_SENDER              = "${app_mailer_sender}"
        APP_GITLAB_API_URL         = "${app_gitlab_api_url}"
        OAUTH_GITLAB_CLIENT_ID     = "${app_gitlab_client_id}"
        OAUTH_GITLAB_CLIENT_SECRET = "${app_gitlab_client_secret}"
      }
    }

    task "cron" {
      driver = "docker"

      config {
        image      = "dockette/repman:${version}"
        command    = "/entrypoint-cron.sh"
        force_pull = true
      }

      resources {
        cpu        = 1000
        memory     = 1024
        memory_max = 4096
      }

      env {
        APP_HOST                   = "${url}"
        APP_DOMAIN_SEPARATOR       = "-"
        APP_ORGANIZATION_SEPARATOR = "-"
        DATABASE_URL               = "postgresql://${db_user}:${db_password}@$${NOMAD_HOST_IP_db}:$${NOMAD_HOST_PORT_db}/${db_dbname}?serverVersion=11&charset=utf8"
        #OAUTH_GITHUB_CLIENT_ID     = "[[.app_github_client_id]]"
        #OAUTH_GITHUB_CLIENT_SECRET = "[[.app_github_client_secret]]"
        PROXY_DIST_DIR             = "var/proxy"
        PACKAGES_DIST_DIR          = "var/repo"
        STORAGE_SOURCE             = "storage.s3"
        STORAGE_AWS_BUCKET         = "${app_s3_bucket}"
        STORAGE_AWS_REGION         = "${app_s3_region}"
        STORAGE_AWS_OPAQUE_AUTH    = "true"
        STORAGE_AWS_KEY            = "${app_s3_key}"
        STORAGE_AWS_SECRET         = "${app_s3_secret}"
        STORAGE_AWS_ENDPOINT       = "${app_s3_endpoint}"
        MAILER_DSN                 = "${app_mailer_dsn}"
        MAILER_SENDER              = "${app_mailer_sender}"
        APP_GITLAB_API_URL         = "${app_gitlab_api_url}"
        OAUTH_GITLAB_CLIENT_ID     = "${app_gitlab_client_id}"
        OAUTH_GITLAB_CLIENT_SECRET = "${app_gitlab_client_secret}"
      }
    }

    task "postgres" {
      driver = "docker"

      config {
        image = "postgres:11.7-alpine"
        ports = ["db"]
      }

      resources {
        cpu        = 1000
        memory     = 1024
        memory_max = 2048
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
        volume      = "repman-db"
        destination = "/var/lib/postgresql/data"
      }

      service {
        name = "$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}"

        check {
          type     = "script"
          command  = "pg_isready"
          args     = ["-q", "-d", "${db_dbname}", "-U", "${db_user}"]
          interval = "10s"
          timeout  = "5s"
        }
      }
    }

  }
}
