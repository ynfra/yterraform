job "${job}" {
  type        = "service"
  datacenters = ["shi"]

  meta {
    version = "${version}"
    hash    = "${hash}"
  }

  group "mariadb" {
    count = 1

    network {
      port "mariadb" {
        to = 3306
      }
    }

    task "mariadb" {
      driver = "docker"

      config {
        image = "mariadb:${version}"
        ports = ["db"]
      }

      resources {
        cpu        = 1000
        memory     = 1024
        memory_max = 2048
      }

      env {
        MARIADB_USER          = "${mariadb_user}"
        MARIADB_PASSWORD      = "${mariadb_password}"
        MARIADB_DATABASE      = "${mariadb_db}"
        MARIADB_ROOT_PASSWORD = "${mariadb_root_password}"
      }

      service {
        check {
          type     = "script"
          command  = "mysqladmin"
          args     = ["ping", "-h", "localhost", "-u", "root", "-p${mariadb_root_password}"]
          interval = "10s"
          timeout  = "5s"
        }
      }
    }
  }
}
