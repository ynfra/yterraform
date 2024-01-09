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

variable "bucket_name" {
  type = string
}

variable "bucket_user" {
  type = string
}

variable "bucket_user_password" {
  type = string
}
