resource "nomad_job" "minio" {
  depends_on = [resource.nomad_csi_volume.minio-data]
  jobspec = templatefile("${path.module}/files/minio.nomad.hcl", {
    api_url       = var.minio_api_url
    admin_url     = var.minio_admin_url
    redirect_url  = var.minio_redirect_url
    version       = var.minio_version
    hash          = var.minio_hash
    root_user     = var.minio_root_user
    root_password = var.minio_root_password,
    resources = {
      cpu        = var.resources_cpu != null ? var.resources_cpu : 1024,
      memory     = var.resources_memory != null ? var.resources_memory : 4096,
      memory_max = var.resources_memory_max != null ? var.resources_memory_max : 6144
    }
  })
}
