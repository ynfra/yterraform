job "rabbitmq" {
  datacenters = ["dc1"]
  type        = "service"


    meta {
        version = "${version}"
        hash    = "${hash}"
        api_url    = "${api_url}"
        admin_url    = "${admin_url}"
    }

  group "rabbitmq" {
    count = 1

    network {
      port "api" {
        to = 5672
      }
      port "admin" {
        to = 15672
      }
      port "metrics" {
        to = 15692
      }
    }

    task "rabbitmq" {
      driver = "docker"
      config {
        image   = "rabbitmq:${rabbitmg_version}"
        ports   = ["api", "admin", "metrics"]
        volumes = [
          "${volume_rabbitmq}:/var/lib/rabbitmq"
        ]
      }

      resources {
        cpu    = 1000
        memory = 1024
      }

      env {
        RABBITMQ_DEFAULT_USER  = "${user}"
        RABBITMQ_DEFAULT_PASS  = "${password}"
        RABBITMQ_ERLANG_COOKIE = "${cookie}"
        RABBITMQ_PLUGINS       = "${plugins}"
      }

      service {
        name = "rabbitmq"
        port = "api"
        tags = [
          "traefik.enable=true",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-api.entrypoints=http",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-api.rule=Host(`${api_url}`)"
        ]

        check {
          name     = "RabbitMQ API"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }

      service {
        name = "rabbitmq-admin"
        port = "admin"
        tags = [
          "traefik.enable=true",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-admin.entrypoints=http",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-admin.rule=Host(`${admin_url}}`)"
        ]

        check {
          name     = "RabbitMQ admin"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }

      service {
        name = "rabbitmq-exporter"
        port = "metrics"

        check {
          name     = "RabbitMQ metrics"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }

  }
}
