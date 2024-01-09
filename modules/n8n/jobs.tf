resource "nomad_job" "n8n" {
  depends_on = [resource.nomad_csi_volume.n8n-data, resource.nomad_csi_volume.n8n-db]
  jobspec    = templatefile("${path.module}/files/n8n.nomad.hcl", {
    url                 = var.n8n_url
    version             = var.n8n_version
    hash                = var.n8n_hash
    encryption_key      = var.n8n_encryption_key
    basic_auth_enabled  = var.n8n_basic_auth_enabled
    basic_auth_user     = var.n8n_basic_auth_user
    basic_auth_password = var.n8n_basic_auth_password
    db_user             = var.n8n_db_user
    db_password         = var.n8n_db_password
    db_dbname           = var.n8n_db_dbname
  })
}
