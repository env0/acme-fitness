locals {
  tofu_templates = ["vpc", "ec2", "s3", "random_pet"]
}

resource "env0_template" "tofu" {
  for_each = toset(local.tofu_templates)

  name             = each.key
  description      = "template of ${each.key}"
  repository       = data.env0_template.this.repository
  path             = "${local.modules_dir}/${each.key}"
  type             = "opentofu"
  opentofu_version = "latest"
  revision         = "main"

  # vcs configuration
  github_installation_id = var.vcs == "github" ? data.env0_template.this.github_installation_id : null
  bitbucket_client_key   = var.vcs == "bitbucket" ? data.env0_template.this.bitbucket_client_key : null
  is_azure_devops        = var.vcs == "azure" ? data.env0_template.this.is_azure_devops : null
  token_id               = var.vcs == "gitlab" || var.vcs == "azure" ? data.env0_template.this.token_id : null
  # token_name      = var.vcs == "gitlab" ? data.env0_template.this.token_name : null
  # gitlab_project_id    = var.vcs == "gitlab" ? data.env0_template.this.gitlab_project_id : null
}

