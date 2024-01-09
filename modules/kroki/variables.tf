variable "nomad_address" {
  type = string
}

variable "kroki_url" {
  type = string
}

variable "kroki_version" {
  type    = string
  default = "0.21.3"
}

variable "kroki_hash" {
  type    = string
  default = "123456789"
}
