variable "nomad_address" {
  type = string
}

variable "checkly_apikey" {
  type = string
}

variable "checkly_version" {
  type    = string
  default = "latest"
}

variable "checkly_hash" {
  type    = string
  default = "123456789"
}
