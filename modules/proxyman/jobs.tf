resource "nomad_job" "proxyman" {
  jobspec = templatefile("${path.module}/files/proxyman.nomad.hcl", {
    hash : var.proxyman_hash
    url : var.proxyman_url
    reverse_url : var.proxyman_reverse_url
  })
}
