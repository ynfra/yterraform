variable "nomad_address" {
  type = string
}

variable "n8n_url" {
  type = string
}

variable "n8n_version" {
  type    = string
  default = "1.7.1"
}

variable "n8n_hash" {
  type    = string
  default = "123456789"
}

variable "n8n_encryption_key" {
  type = string
}

variable "n8n_basic_auth_enabled" {
  type = bool
}

variable "n8n_basic_auth_user" {
  type = string
}

variable "n8n_basic_auth_password" {
  type = string
}

variable "n8n_db_user" {
  type = string
}

variable "n8n_db_password" {
  type = string
}

variable "n8n_db_dbname" {
  type = string
}
