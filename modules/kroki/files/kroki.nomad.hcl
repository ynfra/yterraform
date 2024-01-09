job "kroki" {
  type        = "service"
  datacenters = ["shi"]

  update {
    canary       = 1
    max_parallel = 1
    health_check = "checks"
    auto_revert  = true
    auto_promote = true
  }

  meta {
    url     = "${url}"
    version = "${version}"
    hash    = "${hash}"
  }


  group "kroki" {
    count = 1

    network {
      port "kroki" {
        to = 8000
      }
      port "blockdiag" {
        to = 8001
      }
      port "mermaid" {
        to = 8002
      }
      port "bpmn" {
        to = 8003
      }
      port "excalidraw" {
        to = 8004
      }
    }

    service {
      name = "kroki"
      port = "kroki"

      tags = [
        "traefik.enable=true",
        "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.entrypoints=http",
        "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.rule=Host(`${url}`)",
      ]

      check {
        type     = "http"
        path     = "/"
        interval = "10s"
        timeout  = "5s"
      }
    }

    task "kroki" {
      driver = "docker"

      config {
        image = "yuzutech/kroki:${version}"
        ports = ["kroki"]
      }

      resources {
        cpu        = 500
        memory     = 256
        memory_max = 1024
      }

      env {
        KROKI_BLOCKDIAG_HOST  = "$${NOMAD_HOST_IP_blockdiag}"
        KROKI_BLOCKDIAG_PORT  = "$${NOMAD_HOST_PORT_blockdiag}"
        KROKI_MERMAID_HOST    = "$${NOMAD_HOST_IP_mermaid}"
        KROKI_MERMAID_PORT    = "$${NOMAD_HOST_PORT_mermaid}"
        KROKI_BPMN_HOST       = "$${NOMAD_HOST_IP_bpmn}"
        KROKI_BPMN_PORT       = "$${NOMAD_HOST_PORT_bpmn}"
        KROKI_EXCALIDRAW_HOST = "$${NOMAD_HOST_IP_excalidraw}"
        KROKI_EXCALIDRAW_PORT = "$${NOMAD_HOST_PORT_excalidraw}"
      }
    }

    task "blockdiag" {
      driver = "docker"

      config {
        image = "yuzutech/kroki-blockdiag:${version}"
        ports = ["blockdiag"]
      }

      resources {
        cpu        = 200
        memory     = 128
        memory_max = 512
      }
    }

    task "mermaid" {
      driver = "docker"

      config {
        image = "yuzutech/kroki-mermaid:${version}"
        ports = ["mermaid"]
      }

      resources {
        cpu        = 200
        memory     = 128
        memory_max = 512
      }
    }

    task "bpmn" {
      driver = "docker"

      config {
        image = "yuzutech/kroki-bpmn:${version}"
        ports = ["bpmn"]
      }

      resources {
        cpu        = 200
        memory     = 128
        memory_max = 512
      }
    }

    task "excalidraw" {
      driver = "docker"

      config {
        image = "yuzutech/kroki-excalidraw:${version}"
        ports = ["excalidraw"]
      }

      resources {
        cpu        = 200
        memory     = 128
        memory_max = 512
      }
    }
  }
}
