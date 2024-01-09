job "${job}" {
  type        = "service"
  datacenters = "shi"

  meta {
    version = "${version}"
    hash    = "${hash}"
  }

  group "postgres" {
    count = 1

    network {
      port "postgres" {
        to = 5432
      }
    }

    task "postgres" {
      driver = "docker"

      config {
        image = "postgres:${version}"
        ports = ["db"]
      }

      resources {
        cpu        = 1000
        memory     = 1024
        memory_max = 2048
      }

      env {
        POSTGRES_USER     = "${postgres_user}"
        POSTGRES_PASSWORD = "${postgres_password}"
        POSTGRES_DB       = "${postgres_db}"
      }

      service {
        check {
          type     = "script"
          command  = "pg_isready"
          args     = ["-q", "-d", "${postgres_db}", "-U", "${postgres_user}"]
          interval = "10s"
          timeout  = "5s"
        }
      }
    }
  }
}
