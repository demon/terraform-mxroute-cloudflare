# terraform-mxroute-cloudflare

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

Manage MXroute domains with DNS in Cloudflare.

Used in production 👌

## Demo

```bash
export CLOUDFLARE_API_TOKEN="your-api-token"
export MXROUTE_SERVER="example.mxroute.com"
export MXROUTE_USERNAME="justsomeguy"
export MXROUTE_APIKEY="abc123def456"

cat << TERRAFORM > main.tf

module "mxroute-cloudflare" {
  source = "github.com/demon/terraform-mxroute-cloudflare?ref=v0.1"
  domain = example.com
}

TERRAFORM

terraform init
terraform apply
```

## Provider docs

### Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 5.0 |
| <a name="provider_mxroute"></a> [mxroute](#provider\_mxroute) | ~> 0.5 |

### Resources

| Name | Type |
| ---- | ---- |
| [cloudflare_dns_record.dkim](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |
| [cloudflare_dns_record.dmarc](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |
| [cloudflare_dns_record.mx](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |
| [cloudflare_dns_record.spf](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |
| [cloudflare_dns_record.verification](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |
| [cloudflare_zone.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone) | resource |
| [mxroute_domain.this](https://registry.terraform.io/providers/demon/mxroute/latest/docs/resources/domain) | resource |
| [mxroute_mail_hosting.this](https://registry.terraform.io/providers/demon/mxroute/latest/docs/resources/mail_hosting) | resource |
| [cloudflare_zone.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |
| [mxroute_dns.this](https://registry.terraform.io/providers/demon/mxroute/latest/docs/data-sources/dns) | data source |
| [mxroute_verification_key.this](https://registry.terraform.io/providers/demon/mxroute/latest/docs/data-sources/verification_key) | data source |

### Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input\_cloudflare\_account\_id) | Cloudflare account ID | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | If the Cloudflare zone already exists, provide the zone id. Leaving blank (default) will have Terraform create the zone. | `string` | `""` | no |
| <a name="input_dmarc_record"></a> [dmarc\_record](#input\_dmarc\_record) | If provided, use this value as your DMARC record. | `string` | `""` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The domain to manage Cloudflare & MXroute resources for | `string` | n/a | yes |
| <a name="input_enable_mail_hosting"></a> [enable\_mail\_hosting](#input\_enable\_mail\_hosting) | Whether to enable mail hosting on the domain. | `bool` | `true` | no |

### Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#output\_cloudflare\_zone\_id) | The Cloudflare zone in which we are managing DNS records. |
