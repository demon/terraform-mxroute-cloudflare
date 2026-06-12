variable "cloudflare_account_id" {
  description = "Cloudflare account ID"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "If the Cloudflare zone already exists, provide the zone id. Leaving blank (default) will have Terraform create the zone."
  default     = ""
  type        = string
}

variable "domain" {
  description = "The domain to manage Cloudflare & MXroute resources for"
  type        = string
}

variable "enable_mail_hosting" {
  description = "Whether to enable mail hosting on the domain."
  default     = true
  type        = bool
}

variable "dmarc_record" {
  description = "If provided, use this value as your DMARC record."
  default     = ""
  type        = string
}
