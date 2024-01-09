job "nexus" {
  type        = "service"
  datacenters = ["shi"]

  meta {
    admin_url    = "${admin_url}"
    apt_url      = "${apt_url}"
    registry_url = "${registry_url}"
    version      = "${version}"
    hash         = "${hash}"
  }

  group "nexus" {
    count = 1

    network {
      port "web" { to = 8081 }
      port "docker_read" { to = 15000 }
    }

    volume "nexus-data" {
      type            = "csi"
      source          = "nexus-data"
      read_only       = false
      attachment_mode = "file-system"
      access_mode     = "single-node-writer"
    }

    task "nexus" {
      driver = "docker"

      config {
        image = "dockette/nexus:${version}"
        ports = ["web", "docker_read"]
      }

      resources {
        cpu    = 4000
        memory = 3072
      }

      env {
        JAVA_OPTIONS = "-Xmx3072m -XX:MaxPermSize=1024m"
      }

      volume_mount {
        volume      = "nexus-data"
        destination = "/nexus-data"
      }

      service {
        name = "nexus"
        port = "web"

        tags = [
          "traefik.enable=true",
          "traefik.http.routers.nexus.entrypoints=http",
          "traefik.http.routers.nexus.rule=Host(`${admin_url}`, `${apt_url}`)",
        ]

        check {
          type     = "http"
          path     = "/"
          interval = "30s"
          timeout  = "5s"
        }
      }

      service {
        name = "nexus-docker-read"
        port = "docker_read"

        tags = [
          "traefik.http.routers.nexus-docker-read.entrypoints=http",
          "traefik.http.routers.nexus-docker-read.rule=Host(`${registry_url}`)",
          "traefik.http.routers.nexus-docker-read-v2.entrypoints=http",
          "traefik.http.routers.nexus-docker-read-v2.rule=(Host(`${registry_url}`) && PathPrefix(`/v2/`))",
          "traefik.http.routers.nexus-docker-read-v2.middlewares=nexus-docker-read@consulcatalog",
          "traefik.http.middlewares.nexus-docker-read.headers.customrequestheaders.authorization=Basic ${registry_auth}",
        ]

        check {
          type     = "tcp"
          interval = "30s"
          timeout  = "5s"
        }
      }
    }

  }
}
