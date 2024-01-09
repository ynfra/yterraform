job "proxychain" {
  datacenters = ["shi"]
  type        = "service"

  %{ if nomad_node != "" }
  constraint {
    attribute = "$${node.unique.name}"
    value     = "${nomad_node}"
  }
  %{ endif }

  meta {
    version = "${version}"
    hash    = "${hash}"
  }

  group "proxychain" {
    count = 1

    network {
      port "proxychain" {
        static  = 28000
        to      = 8000
      }
    }

    task "proxychain" {
      driver = "docker"

      config {
        image = "dockette/proxychain:${version}"
        ports = ["proxychain"]
      }

      env {
        PROXY_PORT        = "8000"
        PROXY_VERBOSE     = "false"
        PROXY_PROXYLIST   = "${proxies}"
      }

      resources {
        cpu        = 100
        memory     = 64
        memory_max = 512
      }
    }

  }
}
