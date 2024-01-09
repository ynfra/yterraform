variable "nomad_address" {
  type = string
}
variable "nomad_job" {
  type    = string
  default = "mariadb"
}

variable "mariadb_user" {
  type = string
}
variable "mariadb_password" {
  type = string
}
variable "mariadb_db" {
  type = string
}

variable "mariadb_version" {
  type    = string
  default = "11.0"
}

variable "mariadb_hash" {
  type    = string
  default = "123456789"
}
