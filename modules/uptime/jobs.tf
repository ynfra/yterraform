resource "nomad_job" "uptime" {
  jobspec = templatefile("${path.module}/files/uptime.nomad.hcl", {
    url                  = var.uptime_url
    version              = var.uptime_version
    hash                 = var.uptime_hash
    s3_bucket            = var.uptime_s3_bucket
    s3_path              = var.uptime_s3_path
    s3_region            = var.uptime_s3_region
    s3_endpoint          = var.uptime_s3_endpoint
    s3_access_key_id     = var.uptime_s3_access_key_id
    s3_secret_access_key = var.uptime_s3_secret_access_key
  })
}
