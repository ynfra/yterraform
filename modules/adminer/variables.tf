variable "nomad_address" {
  type = string
}

variable "adminer_url" {
  type = string
}

variable "adminer_version" {
  type    = string
  default = "4"
}

variable "adminer_hash" {
  type    = string
  default = "123456789"
}
