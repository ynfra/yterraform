variable "minio_region" {
  description = "Default MINIO region"
  default     = "us-east-1"
}

variable "minio_server" {
  description = "Default MINIO host and port"
  default     = "localhost"
}

variable "minio_user" {
  description = "MINIO user"
  default     = "admin"
}

variable "minio_password" {
  description = "MINIO password"
  default     = "admin"
}

variable "buckets" {
  type = list(string)
}

variable "user" {
  type = string
}

variable "user_password" {
  type = string
}
