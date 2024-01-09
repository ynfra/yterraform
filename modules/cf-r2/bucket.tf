resource "cloudflare_r2_bucket" "r2" {
  account_id = var.account_id
  name       = var.bucket_name
  location   = var.location != "" ? var.location : null
}
