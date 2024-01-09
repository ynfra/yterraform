job "proxyman" {
  type        = "service"
  datacenters = ["shi"]

  meta {
    url         = "${url}"
    reverse_url = "${reverse_url}"
    hash        = "${hash}"
  }

  group "nginx" {
    count = 1

    network {
      port "nginx" { to = 80 }
    }

    task "nginx" {
      driver = "docker"

      config {
        image   = "nginx:1.25"
        ports   = ["nginx"]
        volumes = [
          "local/nginx.conf:/etc/nginx/nginx.conf",
        ]
      }

      resources {
        cpu    = 100
        memory = 100
      }

      template {
        data = <<EOH
worker_processes auto;
error_log /dev/stderr error;

events {
    worker_connections 4096;
}

http {
  include /etc/nginx/mime.types;
  default_type application/octet-stream;
  charset_types text/css text/plain text/vnd.wap.wml application/javascript application/json application/rss+xml application/xml;

  gzip_types text/plain text/xml text/css
              text/comma-separated-values
              text/javascript application/x-javascript
              application/atom+xml;

  access_log /dev/stdout combined;

  server {
    listen 80;

    location / {
        proxy_pass ${reverse_url};
    }
  }
}
        EOH

        destination   = "local/nginx.conf"
        change_mode   = "signal"
        change_signal = "SIGHUP"
      }

      service {
        name = "$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}"
        port = "nginx"

        tags = [
          "traefik.enable=true",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.entrypoints=http",
          "traefik.http.routers.$${NOMAD_JOB_NAME}-$${NOMAD_TASK_NAME}.rule=Host(`${url}`)"
        ]

        check {
          type     = "http"
          path     = "/"
          interval = "30s"
          timeout  = "2s"
        }
      }
    }
  }
}
