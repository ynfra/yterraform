resource "nomad_job" "echo" {
  jobspec = templatefile("${path.module}/files/echo.nomad.hcl", {
    version : var.echo_version,
    hash : var.echo_hash,
    url : var.echo_url,
  })
}
