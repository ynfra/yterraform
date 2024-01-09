resource "nomad_job" "adminer" {
  jobspec = templatefile("${path.module}/files/adminer.nomad.hcl", {
    url : var.adminer_url
    version : var.adminer_version
    hash : var.adminer_hash
  })
}
