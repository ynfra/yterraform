data "nomad_plugin" "nfs" {
  plugin_id        = "nfs"
  wait_for_healthy = true
}

resource "nomad_csi_volume" "nexus-data" {
  depends_on = [data.nomad_plugin.nfs]

  plugin_id = "nfs"
  volume_id = "nexus-data"
  name      = "nexus-data"

  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }
}
