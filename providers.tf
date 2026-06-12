terraform {
  required_version = ">= 1.5.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }

    mxroute = {
      source  = "demon/mxroute"
      version = "~> 0.5"
    }
  }
}
