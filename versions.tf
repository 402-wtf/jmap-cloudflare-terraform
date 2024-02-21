terraform {
  required_version = "~> 1.7.3"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.22.0"
    }
  }

  backend "s3" {
    key    = "jmap-cloudflare/terraform.tfstate"
    region = "us-east-1"
    endpoints = { s3 = "https://c32b369c8f2bebc2cf1b878b898405c3.r2.cloudflarestorage.com" }

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_s3_checksum            = true
  }
}
