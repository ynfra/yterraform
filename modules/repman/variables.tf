variable "nomad_address" {
  type = string
}

variable "repman_url" {
  type = string
}

variable "repman_version" {
  type    = string
  default = "1.7.1"
}

variable "repman_hash" {
  type    = string
  default = "123456789"
}

variable "repman_app_trusted_proxies" {
  type = string
}

variable "repman_app_github_client_id" {
  type = string
}

variable "repman_app_github_client_secret" {
  type = string
}

variable "repman_app_s3_bucket" {
  type = string
}

variable "repman_app_s3_region" {
  type = string
}

variable "repman_app_s3_key" {
  type = string
}

variable "repman_app_s3_secret" {
  type = string
}

variable "repman_app_s3_endpoint" {
  type = string
}

variable "repman_app_mailer_dsn" {
  type = string
}

variable "repman_app_mailer_sender" {
  type = string
}

variable "repman_app_gitlab_api_url" {
  type = string
}

variable "repman_app_gitlab_client_id" {
  type = string
}

variable "repman_app_gitlab_client_secret" {
  type = string
}

variable "repman_db_user" {
  type = string
}

variable "repman_db_password" {
  type = string
}

variable "repman_db_dbname" {
  type = string
}
