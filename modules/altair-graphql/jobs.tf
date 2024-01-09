resource "nomad_job" "altair-graphql" {
  jobspec = templatefile("${path.module}/files/altair-graphql.nomad.hcl", {
    version : var.altair_version,
    hash : var.altair_hash,
    url : var.altair_url,
  })
}
