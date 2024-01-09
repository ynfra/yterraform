variable "nomad_address" {
  type = string
}

variable "rabbitmg_api_url" {
  type = string
}

variable "rabbitmg_admin_url" {
  type = string
}

variable "rabbitmg_version" {
  type    = string
  default = "3.11-management-alpine"
}

variable "rabbitmg_hash" {
  type    = string
  default = "123456789"
}

variable "rabbitmg_user" {
  type    = string
  default = "rabbitmq"
}

variable "rabbitmg_password" {
  type    = string
  default = "rabbitmq"
}

variable "rabbitmg_cookie" {
  type    = string
  default = "rabbitmq"
}

variable "rabbitmg_volume_rabbitmq" {
  type = string
}

variable "rabbitmg_plugins" {
  type    = string
  default = "rabbitmq_prometheus"
}
