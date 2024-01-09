resource "nomad_job" "proxychain" {
  jobspec = templatefile("${path.module}/files/proxychain.nomad.hcl", {
    nomad_node : var.nomad_node,
    version : var.proxychain_version,
    hash : var.proxychain_hash,
    proxies : join("|", var.proxychain_proxies),
  })
}
