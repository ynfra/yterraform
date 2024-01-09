variable "nomad_address" {
  type = string
}
variable "nomad_job" {
  type    = string
  default = "postgres"
}

variable "postgres_user" {
  type = string
}
variable "postgres_password" {
  type = string
}
variable "postgres_db" {
  type = string
}

variable "postgres_version" {
  type    = string
  default = "15.0"
}

variable "postgres_hash" {
  type    = string
  default = "123456789"
}
