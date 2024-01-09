<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 4.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 4.13.0 |

## Resources

| Name | Type |
|------|------|
| [cloudflare_api_token.token](https://registry.terraform.io/providers/cloudflare/cloudflare/4.13.0/docs/resources/api_token) | resource |
| [cloudflare_api_token_permission_groups.all](https://registry.terraform.io/providers/cloudflare/cloudflare/4.13.0/docs/data-sources/api_token_permission_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Cloudflare Account ID | `string` | n/a | yes |
| <a name="input_api_token"></a> [api\_token](#input\_api\_token) | Cloudflare Account ID | `string` | n/a | yes |
| <a name="input_bucket_read"></a> [bucket\_read](#input\_bucket\_read) | If true, grant read access to the bucket(s) | `bool` | `true` | no |
| <a name="input_bucket_write"></a> [bucket\_write](#input\_bucket\_write) | If true, grant write access to the bucket(s) | `bool` | `true` | no |
| <a name="input_buckets"></a> [buckets](#input\_buckets) | List of R2 buckets to grant access to | `list(string)` | n/a | yes |
| <a name="input_condition_ip_in"></a> [condition\_ip\_in](#input\_condition\_ip\_in) | List of IP addresses or CIDR notation where the token may be used from. If not specified, the token will be valid for all IP addresses. | `list(string)` | `[]` | no |
| <a name="input_condition_ip_not_in"></a> [condition\_ip\_not\_in](#input\_condition\_ip\_not\_in) | List of IP addresses or CIDR notation where the token should not be used from. | `list(string)` | `[]` | no |
| <a name="input_expires_on"></a> [expires\_on](#input\_expires\_on) | The expiration time on or after which the token MUST NOT be accepted for processing. If not specified, the token will not expire. | `string` | `""` | no |
| <a name="input_not_before"></a> [not\_before](#input\_not\_before) | The time before which the token MUST NOT be accepted for processing. If not specified, the token will be valid immediately. | `string` | `""` | no |
| <a name="input_token_name"></a> [token\_name](#input\_token\_name) | Name of the API token.<br>If none given then the fomart is: `R2-<comma seperate names>-<Read if 'bucket-read'>-<Write if 'bucket-write'>` | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | API Token ID.<br>Used as the Access Key ID |
| <a name="output_secret"></a> [secret](#output\_secret) | Secret Access Key |
<!-- END_TF_DOCS -->
