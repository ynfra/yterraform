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
| [nomad_csi_volume.n8n-data](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/csi_volume) | resource |
| [nomad_csi_volume.n8n-db](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/csi_volume) | resource |
| [nomad_job.n8n](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/job) | resource |
| [nomad_plugin.nfs](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/data-sources/plugin) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_n8n_basic_auth_enabled"></a> [n8n\_basic\_auth\_enabled](#input\_n8n\_basic\_auth\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_n8n_basic_auth_password"></a> [n8n\_basic\_auth\_password](#input\_n8n\_basic\_auth\_password) | n/a | `string` | n/a | yes |
| <a name="input_n8n_basic_auth_user"></a> [n8n\_basic\_auth\_user](#input\_n8n\_basic\_auth\_user) | n/a | `string` | n/a | yes |
| <a name="input_n8n_db_dbname"></a> [n8n\_db\_dbname](#input\_n8n\_db\_dbname) | n/a | `string` | n/a | yes |
| <a name="input_n8n_db_password"></a> [n8n\_db\_password](#input\_n8n\_db\_password) | n/a | `string` | n/a | yes |
| <a name="input_n8n_db_user"></a> [n8n\_db\_user](#input\_n8n\_db\_user) | n/a | `string` | n/a | yes |
| <a name="input_n8n_encryption_key"></a> [n8n\_encryption\_key](#input\_n8n\_encryption\_key) | n/a | `string` | n/a | yes |
| <a name="input_n8n_hash"></a> [n8n\_hash](#input\_n8n\_hash) | n/a | `string` | `"123456789"` | no |
| <a name="input_n8n_url"></a> [n8n\_url](#input\_n8n\_url) | n/a | `string` | n/a | yes |
| <a name="input_n8n_version"></a> [n8n\_version](#input\_n8n\_version) | n/a | `string` | `"1.7.1"` | no |
| <a name="input_nomad_address"></a> [nomad\_address](#input\_nomad\_address) | n/a | `string` | n/a | yes |
<!-- END_TF_DOCS -->
