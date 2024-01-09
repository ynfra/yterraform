resource "nomad_job" "openrefine" {
  jobspec = templatefile("${path.module}/files/openrefine.nomad.hcl", {
    url : var.openrefine_url
    version : var.openrefine_version
    hash : var.openrefine_hash
  })
}
