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
| [nomad_csi_volume.nexus-data](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/csi_volume) | resource |
| [nomad_job.nexus](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/job) | resource |
| [nomad_plugin.nfs](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/data-sources/plugin) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nexus_admin_url"></a> [nexus\_admin\_url](#input\_nexus\_admin\_url) | n/a | `string` | n/a | yes |
| <a name="input_nexus_apt_url"></a> [nexus\_apt\_url](#input\_nexus\_apt\_url) | n/a | `string` | n/a | yes |
| <a name="input_nexus_hash"></a> [nexus\_hash](#input\_nexus\_hash) | n/a | `string` | n/a | yes |
| <a name="input_nexus_registry_auth"></a> [nexus\_registry\_auth](#input\_nexus\_registry\_auth) | n/a | `string` | n/a | yes |
| <a name="input_nexus_registry_url"></a> [nexus\_registry\_url](#input\_nexus\_registry\_url) | n/a | `string` | n/a | yes |
| <a name="input_nexus_version"></a> [nexus\_version](#input\_nexus\_version) | n/a | `string` | n/a | yes |
| <a name="input_nomad_address"></a> [nomad\_address](#input\_nomad\_address) | n/a | `string` | n/a | yes |
<!-- END_TF_DOCS -->
