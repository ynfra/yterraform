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
| [nomad_job.openrefine](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nomad_address"></a> [nomad\_address](#input\_nomad\_address) | n/a | `string` | n/a | yes |
| <a name="input_openrefine_hash"></a> [openrefine\_hash](#input\_openrefine\_hash) | n/a | `string` | `"123456789"` | no |
| <a name="input_openrefine_url"></a> [openrefine\_url](#input\_openrefine\_url) | n/a | `string` | n/a | yes |
| <a name="input_openrefine_version"></a> [openrefine\_version](#input\_openrefine\_version) | n/a | `string` | `"3.7.5"` | no |
<!-- END_TF_DOCS -->
