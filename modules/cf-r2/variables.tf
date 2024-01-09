variable "api_token" {
  description = "Cloudflare API token"
  type        = string
}

variable "account_id" {
  description = "Cloudflare Account ID"
  type        = string
}

variable "bucket_name" {
  description = "Cloudflare Account ID"
  type        = string
}

variable "location" {
  description = "Bucket location hint"
  type        = string
  default     = ""
}
