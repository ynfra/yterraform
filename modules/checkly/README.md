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
| [nomad_job.checkly](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_checkly_apikey"></a> [checkly\_apikey](#input\_checkly\_apikey) | n/a | `string` | n/a | yes |
| <a name="input_checkly_hash"></a> [checkly\_hash](#input\_checkly\_hash) | n/a | `string` | `"123456789"` | no |
| <a name="input_checkly_version"></a> [checkly\_version](#input\_checkly\_version) | n/a | `string` | `"latest"` | no |
| <a name="input_nomad_address"></a> [nomad\_address](#input\_nomad\_address) | n/a | `string` | n/a | yes |
<!-- END_TF_DOCS -->
