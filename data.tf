data "mxroute_verification_key" "this" {}

data "mxroute_dns" "this" {
  domain = mxroute_domain.this.name
}

data "cloudflare_zone" "this" {
  count   = var.cloudflare_zone_id != "" ? 1 : 0
  zone_id = var.cloudflare_zone_id
}
