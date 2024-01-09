variable "nomad_address" {
  type = string
}

variable "metabase_url" {
  type = string
}

variable "metabase_version" {
  type    = string
  default = "v0.42.3"
}

variable "metabase_hash" {
  type    = string
  default = "123456789"
}

variable "metabase_timezone" {
  type    = string
  default = "Europe/Prague"
}

variable "metabase_password_complexity" {
  type    = string
  default = "strong"
}

variable "metabase_password_length" {
  type    = string
  default = "20"
}

variable "metabase_db_type" {
  type = string
}

variable "metabase_db_dbname" {
  type = string
}

variable "metabase_db_port" {
  type = string
}

variable "metabase_db_user" {
  type = string
}

variable "metabase_db_pass" {
  type = string
}

variable "metabase_db_host" {
  type = string
}

