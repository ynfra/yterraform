variable "nomad_address" {
  type = string
}

variable "openrefine_url" {
  type = string
}

variable "openrefine_version" {
  type    = string
  default = "3.7.5"
}

variable "openrefine_hash" {
  type    = string
  default = "123456789"
}
