variable "nomad_address" {
  type = string
}

variable "redoc_url" {
  type = string
}

variable "redoc_version" {
  type    = string
  default = "latest"
}

variable "redoc_hash" {
  type    = string
  default = "123456789"
}
