resource "mxroute_domain" "this" {
  name = var.domain

  depends_on = [cloudflare_dns_record.verification]
}

resource "mxroute_mail_hosting" "this" {
  domain  = mxroute_domain.this.name
  enabled = var.enable_mail_hosting
}
