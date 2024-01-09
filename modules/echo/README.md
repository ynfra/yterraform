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
| [nomad_job.echo](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_echo_hash"></a> [echo\_hash](#input\_echo\_hash) | n/a | `string` | `"123456789"` | no |
| <a name="input_echo_url"></a> [echo\_url](#input\_echo\_url) | n/a | `string` | n/a | yes |
| <a name="input_echo_version"></a> [echo\_version](#input\_echo\_version) | n/a | `string` | `"latest"` | no |
| <a name="input_nomad_address"></a> [nomad\_address](#input\_nomad\_address) | n/a | `string` | n/a | yes |
<!-- END_TF_DOCS -->
