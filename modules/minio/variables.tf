variable "nomad_address" {
  type = string
}

variable "minio_api_url" {
  type = string
}

variable "minio_admin_url" {
  type = string
}

variable "minio_redirect_url" {
  type = string
}
variable "minio_version" {
  type    = string
  default = "RELEASE.2023-08-16T20-17-30Z"
}

variable "minio_hash" {
  type    = string
  default = "123456789"
}

variable "minio_root_user" {
  type = string
}

variable "minio_root_password" {
  type = string
}

variable "minio_region" {
  type = string
}

variable "resources_cpu" {
  type = string
  default = null
}

variable "resources_memory" {
  type = string
  default = null
}

variable "resources_memory_max" {
  type = string
  default = null
}
