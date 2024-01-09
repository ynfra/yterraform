<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_nomad"></a> [nomad](#requirement\_nomad) | 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_nomad"></a> [nomad](#provider\_nomad) | 2.0.0 |

## Resources

| Name | Type |
|------|------|
| [nomad_job.uptime](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nomad_address"></a> [nomad\_address](#input\_nomad\_address) | n/a | `string` | n/a | yes |
| <a name="input_uptime_hash"></a> [uptime\_hash](#input\_uptime\_hash) | n/a | `string` | `"123456789"` | no |
| <a name="input_uptime_s3_access_key_id"></a> [uptime\_s3\_access\_key\_id](#input\_uptime\_s3\_access\_key\_id) | n/a | `string` | n/a | yes |
| <a name="input_uptime_s3_bucket"></a> [uptime\_s3\_bucket](#input\_uptime\_s3\_bucket) | n/a | `string` | n/a | yes |
| <a name="input_uptime_s3_endpoint"></a> [uptime\_s3\_endpoint](#input\_uptime\_s3\_endpoint) | n/a | `string` | n/a | yes |
| <a name="input_uptime_s3_path"></a> [uptime\_s3\_path](#input\_uptime\_s3\_path) | n/a | `string` | n/a | yes |
| <a name="input_uptime_s3_region"></a> [uptime\_s3\_region](#input\_uptime\_s3\_region) | n/a | `string` | n/a | yes |
| <a name="input_uptime_s3_secret_access_key"></a> [uptime\_s3\_secret\_access\_key](#input\_uptime\_s3\_secret\_access\_key) | n/a | `string` | n/a | yes |
| <a name="input_uptime_url"></a> [uptime\_url](#input\_uptime\_url) | n/a | `string` | n/a | yes |
| <a name="input_uptime_version"></a> [uptime\_version](#input\_uptime\_version) | n/a | `string` | `"latest"` | no |
<!-- END_TF_DOCS -->
