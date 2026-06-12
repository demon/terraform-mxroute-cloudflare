locals {
  cloudflare_zone_id = try(cloudflare_zone.this[0].id, data.cloudflare_zone.this[0].zone_id)
}
