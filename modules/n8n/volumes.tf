data "nomad_plugin" "nfs" {
  plugin_id        = "nfs"
  wait_for_healthy = true
}

resource "nomad_csi_volume" "n8n-data" {
  depends_on = [data.nomad_plugin.nfs]

  plugin_id = "nfs"
  volume_id = "n8n-data"
  name      = "n8n-data"

  capability {
    access_mode     = "multi-node-multi-writer"
    attachment_mode = "file-system"
  }
}

resource "nomad_csi_volume" "n8n-db" {
  depends_on = [data.nomad_plugin.nfs]

  plugin_id = "nfs"
  volume_id = "n8n-db"
  name      = "n8n-db"

  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }
}
