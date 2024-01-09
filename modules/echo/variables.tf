variable "nomad_address" {
  type = string
}

variable "echo_url" {
  type = string
}

variable "echo_version" {
  type    = string
  default = "latest"
}

variable "echo_hash" {
  type    = string
  default = "123456789"
}
