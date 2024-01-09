resource "nomad_job" "rabbitmq" {
  jobspec = templatefile("${path.module}/files/rabbitmq.nomad.hcl", {
    api_url   = var.rabbitmq_api_url
    admin_url = var.rabbitmq_admin_url
    version   = var.rabbitmq_version
    user      = var.rabbitmq_user
    password  = var.rabbitmq_password
    plugins   = var.rabbitmq_plugins
    cookie    = var.rabbitmg_cookie
  })
}
