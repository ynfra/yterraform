<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_minio"></a> [minio](#requirement\_minio) | 1.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_minio"></a> [minio](#provider\_minio) | 1.18.0 |

## Resources

| Name | Type |
|------|------|
| [minio_iam_policy.anonymouse_policy](https://registry.terraform.io/providers/aminueza/minio/1.18.0/docs/resources/iam_policy) | resource |
| [minio_iam_policy.policy](https://registry.terraform.io/providers/aminueza/minio/1.18.0/docs/resources/iam_policy) | resource |
| [minio_iam_user.user](https://registry.terraform.io/providers/aminueza/minio/1.18.0/docs/resources/iam_user) | resource |
| [minio_iam_user_policy_attachment.policy_to_user](https://registry.terraform.io/providers/aminueza/minio/1.18.0/docs/resources/iam_user_policy_attachment) | resource |
| [minio_s3_bucket.bucket](https://registry.terraform.io/providers/aminueza/minio/1.18.0/docs/resources/s3_bucket) | resource |
| [minio_s3_bucket_policy.policy](https://registry.terraform.io/providers/aminueza/minio/1.18.0/docs/resources/s3_bucket_policy) | resource |
| [minio_s3_bucket_versioning.bucket](https://registry.terraform.io/providers/aminueza/minio/1.18.0/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_bucket_user"></a> [bucket\_user](#input\_bucket\_user) | n/a | `string` | n/a | yes |
| <a name="input_bucket_user_password"></a> [bucket\_user\_password](#input\_bucket\_user\_password) | n/a | `string` | n/a | yes |
| <a name="input_minio_password"></a> [minio\_password](#input\_minio\_password) | MINIO password | `string` | `"admin"` | no |
| <a name="input_minio_region"></a> [minio\_region](#input\_minio\_region) | Default MINIO region | `string` | `"us-east-1"` | no |
| <a name="input_minio_server"></a> [minio\_server](#input\_minio\_server) | Default MINIO host and port | `string` | `"localhost"` | no |
| <a name="input_minio_user"></a> [minio\_user](#input\_minio\_user) | MINIO user | `string` | `"admin"` | no |
<!-- END_TF_DOCS -->
