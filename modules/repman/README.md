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
| [nomad_csi_volume.repman-db](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/csi_volume) | resource |
| [nomad_job.repman](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/job) | resource |
| [nomad_plugin.nfs](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/data-sources/plugin) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nomad_address"></a> [nomad\_address](#input\_nomad\_address) | n/a | `string` | n/a | yes |
| <a name="input_repman_app_github_client_id"></a> [repman\_app\_github\_client\_id](#input\_repman\_app\_github\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_repman_app_github_client_secret"></a> [repman\_app\_github\_client\_secret](#input\_repman\_app\_github\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_repman_app_gitlab_api_url"></a> [repman\_app\_gitlab\_api\_url](#input\_repman\_app\_gitlab\_api\_url) | n/a | `string` | n/a | yes |
| <a name="input_repman_app_gitlab_client_id"></a> [repman\_app\_gitlab\_client\_id](#input\_repman\_app\_gitlab\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_repman_app_gitlab_client_secret"></a> [repman\_app\_gitlab\_client\_secret](#input\_repman\_app\_gitlab\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_repman_app_mailer_dsn"></a> [repman\_app\_mailer\_dsn](#input\_repman\_app\_mailer\_dsn) | n/a | `string` | n/a | yes |
| <a name="input_repman_app_mailer_sender"></a> [repman\_app\_mailer\_sender](#input\_repman\_app\_mailer\_sender) | n/a | `string` | n/a | yes |
| <a name="input_repman_app_s3_bucket"></a> [repman\_app\_s3\_bucket](#input\_repman\_app\_s3\_bucket) | n/a | `string` | n/a | yes |
| <a name="input_repman_app_s3_endpoint"></a> [repman\_app\_s3\_endpoint](#input\_repman\_app\_s3\_endpoint) | n/a | `string` | n/a | yes |
| <a name="input_repman_app_s3_key"></a> [repman\_app\_s3\_key](#input\_repman\_app\_s3\_key) | n/a | `string` | n/a | yes |
| <a name="input_repman_app_s3_region"></a> [repman\_app\_s3\_region](#input\_repman\_app\_s3\_region) | n/a | `string` | n/a | yes |
| <a name="input_repman_app_s3_secret"></a> [repman\_app\_s3\_secret](#input\_repman\_app\_s3\_secret) | n/a | `string` | n/a | yes |
| <a name="input_repman_app_trusted_proxies"></a> [repman\_app\_trusted\_proxies](#input\_repman\_app\_trusted\_proxies) | n/a | `string` | n/a | yes |
| <a name="input_repman_db_dbname"></a> [repman\_db\_dbname](#input\_repman\_db\_dbname) | n/a | `string` | n/a | yes |
| <a name="input_repman_db_password"></a> [repman\_db\_password](#input\_repman\_db\_password) | n/a | `string` | n/a | yes |
| <a name="input_repman_db_user"></a> [repman\_db\_user](#input\_repman\_db\_user) | n/a | `string` | n/a | yes |
| <a name="input_repman_hash"></a> [repman\_hash](#input\_repman\_hash) | n/a | `string` | `"123456789"` | no |
| <a name="input_repman_url"></a> [repman\_url](#input\_repman\_url) | n/a | `string` | n/a | yes |
| <a name="input_repman_version"></a> [repman\_version](#input\_repman\_version) | n/a | `string` | `"1.7.1"` | no |
<!-- END_TF_DOCS -->
