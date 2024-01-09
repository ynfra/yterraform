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
| [nomad_csi_volume.minio-data](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/csi_volume) | resource |
| [nomad_job.minio](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/job) | resource |
| [nomad_plugin.nfs](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/data-sources/plugin) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_minio_admin_url"></a> [minio\_admin\_url](#input\_minio\_admin\_url) | n/a | `string` | n/a | yes |
| <a name="input_minio_api_url"></a> [minio\_api\_url](#input\_minio\_api\_url) | n/a | `string` | n/a | yes |
| <a name="input_minio_hash"></a> [minio\_hash](#input\_minio\_hash) | n/a | `string` | `"123456789"` | no |
| <a name="input_minio_redirect_url"></a> [minio\_redirect\_url](#input\_minio\_redirect\_url) | n/a | `string` | n/a | yes |
| <a name="input_minio_region"></a> [minio\_region](#input\_minio\_region) | n/a | `string` | n/a | yes |
| <a name="input_minio_root_password"></a> [minio\_root\_password](#input\_minio\_root\_password) | n/a | `string` | n/a | yes |
| <a name="input_minio_root_user"></a> [minio\_root\_user](#input\_minio\_root\_user) | n/a | `string` | n/a | yes |
| <a name="input_minio_version"></a> [minio\_version](#input\_minio\_version) | n/a | `string` | `"RELEASE.2023-08-16T20-17-30Z"` | no |
| <a name="input_nomad_address"></a> [nomad\_address](#input\_nomad\_address) | n/a | `string` | n/a | yes |
<!-- END_TF_DOCS -->
