resource "nomad_job" "nexus" {
  depends_on = [resource.nomad_csi_volume.nexus-data]
  jobspec    = templatefile("${path.module}/files/nexus.nomad.hcl", {
    version       = var.nexus_version
    hash          = var.nexus_hash
    admin_url     = var.nexus_admin_url
    apt_url       = var.nexus_apt_url
    registry_url  = var.nexus_registry_url
    registry_auth = var.nexus_registry_auth
  })
}
