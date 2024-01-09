job "checkly" {
  type        = "service"
  datacenters = ["shi"]

  meta {
    url     = "${adminer_url}"
    version = "${adminer_version}"
    hash    = "${adminer_hash}"
  }

  group "checkly" {
    count = 1

    task "checkly" {
      driver = "docker"

      env {
        API_KEY         = "${apikey}"
        JOB_CONCURRENCY = 1
      }

      config {
        image = "ghcr.io/checkly/agent:${version}"
      }

      resources {
        cpu    = 1000
        memory = 1048
      }
    }
  }
}
