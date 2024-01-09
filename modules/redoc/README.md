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
| [nomad_job.redoc](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nomad_address"></a> [nomad\_address](#input\_nomad\_address) | n/a | `string` | n/a | yes |
| <a name="input_redoc_hash"></a> [redoc\_hash](#input\_redoc\_hash) | n/a | `string` | `"123456789"` | no |
| <a name="input_redoc_url"></a> [redoc\_url](#input\_redoc\_url) | n/a | `string` | n/a | yes |
| <a name="input_redoc_version"></a> [redoc\_version](#input\_redoc\_version) | n/a | `string` | `"latest"` | no |
<!-- END_TF_DOCS -->
