variable "nomad_address" {
  type = string
}

variable "altair_url" {
  type = string
}

variable "altair_version" {
  type    = string
  default = "latest"
}

variable "altair_hash" {
  type    = string
  default = "123456789"
}
