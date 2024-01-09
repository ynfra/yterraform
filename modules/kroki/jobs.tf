resource "nomad_job" "kroki" {
  jobspec = templatefile("${path.module}/files/kroki.nomad.hcl", {
    version : var.kroki_version,
    hash : var.kroki_hash,
    url : var.kroki_url,
  })
}
