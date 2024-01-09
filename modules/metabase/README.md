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
| [nomad_job.metabase](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_metabase_db_dbname"></a> [metabase\_db\_dbname](#input\_metabase\_db\_dbname) | n/a | `string` | n/a | yes |
| <a name="input_metabase_db_host"></a> [metabase\_db\_host](#input\_metabase\_db\_host) | n/a | `string` | n/a | yes |
| <a name="input_metabase_db_pass"></a> [metabase\_db\_pass](#input\_metabase\_db\_pass) | n/a | `string` | n/a | yes |
| <a name="input_metabase_db_port"></a> [metabase\_db\_port](#input\_metabase\_db\_port) | n/a | `string` | n/a | yes |
| <a name="input_metabase_db_type"></a> [metabase\_db\_type](#input\_metabase\_db\_type) | n/a | `string` | n/a | yes |
| <a name="input_metabase_db_user"></a> [metabase\_db\_user](#input\_metabase\_db\_user) | n/a | `string` | n/a | yes |
| <a name="input_metabase_hash"></a> [metabase\_hash](#input\_metabase\_hash) | n/a | `string` | `"123456789"` | no |
| <a name="input_metabase_password_complexity"></a> [metabase\_password\_complexity](#input\_metabase\_password\_complexity) | n/a | `string` | `"strong"` | no |
| <a name="input_metabase_password_length"></a> [metabase\_password\_length](#input\_metabase\_password\_length) | n/a | `string` | `"20"` | no |
| <a name="input_metabase_timezone"></a> [metabase\_timezone](#input\_metabase\_timezone) | n/a | `string` | `"Europe/Prague"` | no |
| <a name="input_metabase_url"></a> [metabase\_url](#input\_metabase\_url) | n/a | `string` | n/a | yes |
| <a name="input_metabase_version"></a> [metabase\_version](#input\_metabase\_version) | n/a | `string` | `"v0.42.3"` | no |
| <a name="input_nomad_address"></a> [nomad\_address](#input\_nomad\_address) | n/a | `string` | n/a | yes |
<!-- END_TF_DOCS -->
