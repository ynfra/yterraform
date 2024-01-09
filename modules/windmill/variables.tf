variable "nomad_address" {
  type = string
}

variable "wm_url" {
  type = string
}

variable "wm_db_user" {
  type = string
}

variable "wm_db_password" {
  type = string
}

variable "wm_db_db" {
  type = string
}

variable "wm_request_limit" {
  type = string
}

variable "wm_version" {
  type    = string
  default = "1.144.4"
}

variable "wm_hash" {
  type    = string
  default = "123456789"
}

variable "wm_smtp_from" {
  type = string
}

variable "wm_smtp_host" {
  type = string
}

variable "wm_smtp_port" {
  type = number
}

variable "wm_smtp_username" {
  type = string
}

variable "wm_smtp_password" {
  type = string
}
