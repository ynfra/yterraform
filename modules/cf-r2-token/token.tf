data "cloudflare_api_token_permission_groups" "all" {}

resource "cloudflare_api_token" "token" {
  name = var.token_name != "" ? var.token_name : "R2-${join(",", var.buckets)}-${var.bucket_read ? "Read" : ""}-${var.bucket_write ? "Write" : ""}"
  policy {
    permission_groups = compact([
      var.bucket_read ? data.cloudflare_api_token_permission_groups.all.permissions["Workers R2 Storage Bucket Item Read"] : null,
      var.bucket_write ? data.cloudflare_api_token_permission_groups.all.permissions["Workers R2 Storage Bucket Item Write"] : null,
    ])
    resources = {for bucket in var.buckets : "com.cloudflare.edge.r2.bucket.${var.account_id}_default_${bucket}" => "*"}
  }
  not_before = var.not_before != "" ? var.not_before : timestamp()
  expires_on = var.expires_on != "" ? var.expires_on : null
  condition {
    request_ip {
      in     = var.condition_ip_in
      not_in = var.condition_ip_not_in
    }
  }
}

output "id" {
  value       = cloudflare_api_token.token.id
  description = "API Token ID.\nUsed as the Access Key ID"
}

output "secret" {
  value       = sha256(cloudflare_api_token.token.value)
  description = "Secret Access Key"
}
