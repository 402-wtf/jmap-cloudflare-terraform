variable "account_id" {
  type        = string
  description = "Cloudflare account ID"
}

variable "resource_prefix" {
  type        = string
  description = "Prefix added to resources"
}

variable "ui_domain" {
  type        = string
  description = "Domain used to deploy UI"
}
