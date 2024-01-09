variable "nomad_address" {
  type = string
}

variable "nomad_node" {
  type = string
}

variable "proxychain_version" {
  type    = string
  default = "latest"
}

variable "proxychain_proxies" {
  type    = list(string)
}

variable "proxychain_hash" {
  type    = string
  default = "123456789"
}
