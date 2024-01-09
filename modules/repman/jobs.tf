resource "nomad_job" "repman" {
  depends_on = [resource.nomad_csi_volume.repman-db]
  jobspec    = templatefile("${path.module}/files/repman.nomad.hcl", {
    url                      = var.repman_url
    version                  = var.repman_version
    hash                     = var.repman_hash
    app_trusted_proxies      = var.repman_app_trusted_proxies
    app_github_client_id     = var.repman_app_github_client_id
    app_github_client_secret = var.repman_app_github_client_secret
    app_s3_bucket            = var.repman_app_s3_bucket
    app_s3_region            = var.repman_app_s3_region
    app_s3_key               = var.repman_app_s3_key
    app_s3_secret            = var.repman_app_s3_secret
    app_s3_endpoint          = var.repman_app_s3_endpoint
    app_mailer_dsn           = var.repman_app_mailer_dsn
    app_mailer_sender        = var.repman_app_mailer_sender
    app_gitlab_api_url       = var.repman_app_gitlab_api_url
    app_gitlab_client_id     = var.repman_app_gitlab_client_id
    app_gitlab_client_secret = var.repman_app_gitlab_client_secret
    db_user                  = var.repman_db_user
    db_password              = var.repman_db_password
    db_dbname                = var.repman_db_dbname
  })
}
