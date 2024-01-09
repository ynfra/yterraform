resource "nomad_job" "corsanywhere" {
  jobspec = templatefile("${path.module}/files/corsanywhere.nomad.hcl", {
    url = var.corsanywhere_url
  })
}
