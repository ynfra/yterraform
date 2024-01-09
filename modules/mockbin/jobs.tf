resource "nomad_job" "mockbin" {
  jobspec = templatefile("${path.module}/files/mockbin.nomad.hcl", {
    url     = var.mockbin_url
    version = var.mockbin_version
    hash    = var.mockbin_hash
  })
}
