id        = "windmill_db"
name      = "windmill_db"
namespace = "default"
type      = "csi"
plugin_id = "nfs"

capability {
  access_mode     = "single-node-writer"
  attachment_mode = "file-system"
}
