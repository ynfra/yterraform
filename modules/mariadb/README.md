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
| [nomad_job.mariadb](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mariadb_db"></a> [mariadb\_db](#input\_mariadb\_db) | n/a | `string` | n/a | yes |
| <a name="input_mariadb_hash"></a> [mariadb\_hash](#input\_mariadb\_hash) | n/a | `string` | `"123456789"` | no |
| <a name="input_mariadb_password"></a> [mariadb\_password](#input\_mariadb\_password) | n/a | `string` | n/a | yes |
| <a name="input_mariadb_user"></a> [mariadb\_user](#input\_mariadb\_user) | n/a | `string` | n/a | yes |
| <a name="input_mariadb_version"></a> [mariadb\_version](#input\_mariadb\_version) | n/a | `string` | `"11.0"` | no |
| <a name="input_nomad_address"></a> [nomad\_address](#input\_nomad\_address) | n/a | `string` | n/a | yes |
| <a name="input_nomad_job"></a> [nomad\_job](#input\_nomad\_job) | n/a | `string` | `"mariadb"` | no |
<!-- END_TF_DOCS -->
