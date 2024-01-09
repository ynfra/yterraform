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
| [nomad_job.adminer](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_adminer_hash"></a> [adminer\_hash](#input\_adminer\_hash) | n/a | `string` | `"123456789"` | no |
| <a name="input_adminer_url"></a> [adminer\_url](#input\_adminer\_url) | n/a | `string` | n/a | yes |
| <a name="input_adminer_version"></a> [adminer\_version](#input\_adminer\_version) | n/a | `string` | `"4"` | no |
| <a name="input_nomad_address"></a> [nomad\_address](#input\_nomad\_address) | n/a | `string` | n/a | yes |
<!-- END_TF_DOCS -->
