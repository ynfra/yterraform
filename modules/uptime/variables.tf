variable "nomad_address" {
  type = string
}

variable "uptime_url" {
  type = string
}

variable "uptime_version" {
  type    = string
  default = "latest"
}

variable "uptime_hash" {
  type    = string
  default = "123456789"
}

variable "uptime_s3_bucket" {
  type = string
}

variable "uptime_s3_path" {
  type = string
}

variable "uptime_s3_region" {
  type = string
}

variable "uptime_s3_endpoint" {
  type = string
}

variable "uptime_s3_access_key_id" {
  type = string
}

variable "uptime_s3_secret_access_key" {
  type = string
}
