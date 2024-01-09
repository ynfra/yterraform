# data "nomad_plugin" "nfs" {
#   plugin_id        = "nfs"
#   wait_for_healthy = true
# }

# resource "nomad_csi_volume" "windmill_db" {
#   depends_on = [data.nomad_plugin.nfs]

#   plugin_id = "nfs"
#   volume_id = "windmill_db"
#   name      = "windmill_db"

#   capability {
#     access_mode     = "single-node-writer"
#     attachment_mode = "file-system"
#   }
# }

resource "null_resource" "windmill_db_volume" {
  provisioner "local-exec" {
    environment = {
      NOMAD_ADDR = var.nomad_address
    }
    command = "nomad volume create ${path.module}/files/windmill_db.volume.hcl"
  }
}
