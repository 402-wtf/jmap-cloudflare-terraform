resource "cloudflare_pages_project" "ui_deploy" {
  account_id        = var.account_id
  name              = join("-", compact([var.resource_prefix, "jmap-ui"]))
  production_branch = "main"
  build_config {
    build_command       = "npm run depend-install && npm run build"
    destination_dir     = "out"
    root_dir            = "packages/jmap-ui"
  }
  source {
    type = "github"
    config {
      owner = "402-wtf"
      repo_name = "jmap-cloudflare"
      production_branch = "main"
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "custom"
      preview_branch_includes       = ["dev", "preview"]
      preview_branch_excludes       = ["main", "prod"]
    }
  }
}

resource "cloudflare_pages_domain" "ui_deploy" {
  account_id   = var.account_id
  project_name = join("-", compact([var.resource_prefix, "jmap-ui"]))
  domain       = var.ui_domain

  # TODO: When replacing the pages-project, this needs to be deleted beforehand.
  #  It does not need to be replaced if the pages_project is updated in-place.
  #  lifecycle {
  #    replace_triggered_by = [
  #      cloudflare_pages_project.ui_deploy
  #    ]
  #  }
}

data "cloudflare_zone" "ui_deploy" {
  name = trimprefix(var.ui_domain, "email.")
}

resource "cloudflare_record" "ui_deploy" {
  zone_id = data.cloudflare_zone.ui_deploy.id
  name    = "email"
  value   = cloudflare_pages_project.ui_deploy.subdomain
  type    = "CNAME"
  ttl     = 300
}
