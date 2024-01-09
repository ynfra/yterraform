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
| [nomad_job.postgres](https://registry.terraform.io/providers/hashicorp/nomad/2.0.0/docs/resources/job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nomad_address"></a> [nomad\_address](#input\_nomad\_address) | n/a | `string` | n/a | yes |
| <a name="input_nomad_job"></a> [nomad\_job](#input\_nomad\_job) | n/a | `string` | `"postgres"` | no |
| <a name="input_postgres_db"></a> [postgres\_db](#input\_postgres\_db) | n/a | `string` | n/a | yes |
| <a name="input_postgres_hash"></a> [postgres\_hash](#input\_postgres\_hash) | n/a | `string` | `"123456789"` | no |
| <a name="input_postgres_password"></a> [postgres\_password](#input\_postgres\_password) | n/a | `string` | n/a | yes |
| <a name="input_postgres_user"></a> [postgres\_user](#input\_postgres\_user) | n/a | `string` | n/a | yes |
| <a name="input_postgres_version"></a> [postgres\_version](#input\_postgres\_version) | n/a | `string` | `"15.0"` | no |
<!-- END_TF_DOCS -->
