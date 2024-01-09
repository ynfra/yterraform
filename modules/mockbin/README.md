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
| [nomad_job.mockbin](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mockbin_hash"></a> [mockbin\_hash](#input\_mockbin\_hash) | n/a | `string` | `"123456789"` | no |
| <a name="input_mockbin_url"></a> [mockbin\_url](#input\_mockbin\_url) | n/a | `string` | n/a | yes |
| <a name="input_mockbin_version"></a> [mockbin\_version](#input\_mockbin\_version) | n/a | `string` | `"latest"` | no |
| <a name="input_nomad_address"></a> [nomad\_address](#input\_nomad\_address) | n/a | `string` | n/a | yes |
<!-- END_TF_DOCS -->
