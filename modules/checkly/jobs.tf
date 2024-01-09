resource "nomad_job" "checkly" {
  jobspec = templatefile("${path.module}/files/checkly.nomad.hcl", {
    apikey : var.checkly_apikey
    version : var.checkly_version
    hash : var.checkly_hash
  })
}
