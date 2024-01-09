<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_nomad"></a> [nomad](#requirement\_nomad) | 2.0.0-beta.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_nomad"></a> [nomad](#provider\_nomad) | 2.0.0-beta.1 |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Resources

| Name | Type |
|------|------|
| [nomad_job.windmill](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0-beta.1/docs/resources/job) | resource |
| [null_resource.windmill_db_volume](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nomad_address"></a> [nomad\_address](#input\_nomad\_address) | n/a | `string` | n/a | yes |
| <a name="input_wm_db_db"></a> [wm\_db\_db](#input\_wm\_db\_db) | n/a | `string` | n/a | yes |
| <a name="input_wm_db_password"></a> [wm\_db\_password](#input\_wm\_db\_password) | n/a | `string` | n/a | yes |
| <a name="input_wm_db_user"></a> [wm\_db\_user](#input\_wm\_db\_user) | n/a | `string` | n/a | yes |
| <a name="input_wm_hash"></a> [wm\_hash](#input\_wm\_hash) | n/a | `string` | `"123456789"` | no |
| <a name="input_wm_request_limit"></a> [wm\_request\_limit](#input\_wm\_request\_limit) | n/a | `string` | n/a | yes |
| <a name="input_wm_url"></a> [wm\_url](#input\_wm\_url) | n/a | `string` | n/a | yes |
| <a name="input_wm_version"></a> [wm\_version](#input\_wm\_version) | n/a | `string` | `"1.144.4"` | no |
<!-- END_TF_DOCS -->
