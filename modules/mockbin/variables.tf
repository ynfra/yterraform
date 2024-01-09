variable "nomad_address" {
  type = string
}

variable "mockbin_url" {
  type = string
}

variable "mockbin_version" {
  type    = string
  default = "latest"
}

variable "mockbin_hash" {
  type    = string
  default = "123456789"
}
