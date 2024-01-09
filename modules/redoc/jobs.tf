resource "nomad_job" "redoc" {
  jobspec = templatefile("${path.module}/files/redoc.nomad.hcl", {
    url     = var.redoc_url
    version = var.redoc_version
    hash    = var.redoc_hash
  })
}
