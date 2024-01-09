resource "nomad_job" "windmill" {
  depends_on = [resource.null_resource.windmill_db_volume]
  jobspec = templatefile("${path.module}/files/windmill.nomad.hcl", {
    url           = var.wm_url
    db_user       = var.wm_db_user
    db_password   = var.wm_db_password
    db_db         = var.wm_db_db
    request_limit = var.wm_request_limit
    version       = var.wm_version
    hash          = var.wm_hash
    smtp_from     = var.wm_smtp_from
    smtp_host     = var.wm_smtp_host
    smtp_port     = var.wm_smtp_port
    smtp_username = var.wm_smtp_username
    smtp_password = var.wm_smtp_password
  })
}
