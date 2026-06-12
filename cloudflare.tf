resource "cloudflare_zone" "this" {
  count = var.cloudflare_zone_id == "" ? 1 : 0

  account = {
    id = var.cloudflare_account_id
  }
  name = var.domain
  type = "full"
}

resource "cloudflare_dns_record" "verification" {
  zone_id = local.cloudflare_zone_id
  name    = data.mxroute_verification_key.this.record.name
  type    = data.mxroute_verification_key.this.record.type
  content = data.mxroute_verification_key.this.record.value
  ttl     = "3600"
  comment = "Managed by Terraform (MXroute domain verification)"
}

resource "cloudflare_dns_record" "mx" {
  for_each = {
    for mx in data.mxroute_dns.this.mx_records : mx.hostname => mx
  }

  zone_id  = local.cloudflare_zone_id
  name     = var.domain
  type     = "MX"
  content  = each.value.hostname
  priority = each.value.priority
  ttl      = "3600"
  comment  = each.value.description
}

resource "cloudflare_dns_record" "spf" {
  zone_id = local.cloudflare_zone_id
  name    = data.mxroute_dns.this.spf.name
  type    = data.mxroute_dns.this.spf.type
  content = data.mxroute_dns.this.spf.value
  ttl     = "3600"
  comment = "Managed by Terraform (SPF)"
}

resource "cloudflare_dns_record" "dkim" {
  zone_id = local.cloudflare_zone_id
  name    = data.mxroute_dns.this.dkim.name
  type    = data.mxroute_dns.this.dkim.type
  content = data.mxroute_dns.this.dkim.value
  ttl     = "3600"
  comment = "Managed by Terraform (DKIM)"
}

resource "cloudflare_dns_record" "dmarc" {
  count = var.dmarc_record != "" ? 1 : 0

  zone_id = local.cloudflare_zone_id
  name    = "_dmarc"
  type    = "TXT"
  content = var.dmarc_record
  ttl     = "3600"
  comment = "Managed by MXroute (DMARC)"
}
