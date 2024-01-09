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
| [cloudflare_r2_bucket.r2](https://registry.terraform.io/providers/cloudflare/cloudflare/4.13.0/docs/resources/r2_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Cloudflare Account ID | `string` | n/a | yes |
| <a name="input_api_token"></a> [api\_token](#input\_api\_token) | Cloudflare API token | `string` | n/a | yes |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Cloudflare Account ID | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Bucket location hint | `string` | `""` | no |
<!-- END_TF_DOCS -->
