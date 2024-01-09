job "blackfire" {
  datacenters = ["shi"]

  update {
    canary       = 1
    max_parallel = 1
    health_check = "checks"
    auto_revert  = true
    auto_promote = true
  }

  group "blackfire" {
    count = 1

    network {
      port "blackfire" { to = 8307 }
    }

    task "blackfire" {
      driver = "docker"

      config {
        image = "blackfire/blackfire:2"
        ports = ["blackfire"]
      }

      resources {
        cpu    = 200
        memory = 256
      }

      env {
        BLACKFIRE_LOG_LEVEL    = 4
        BLACKFIRE_SERVER_ID    = ""
        BLACKFIRE_SERVER_TOKEN = ""
      }

      service {
        name = "blackfire"
        port = "blackfire"

        check {
          type     = "tcp"
          interval = "30s"
          timeout  = "2s"
        }
      }
    }
  }
}
