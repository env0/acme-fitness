locals {
  tofu_templates = [vpc, ec2, s3, random_pet]
  modules_dir    = "modules"
}

resource "env0_template" "tofu" {
  for_each = toset(local.tofu_templates)

  name             = each.key
  description      = "Default template of ${each.key}"
  repository       = data.env0_template.this.repository
  path             = "${local.modules_dir}/${each.key}"
  type             = "opentofu"
  opentofu_version = "latest"
  revision         = "main"

  # vcs configuration
  github_installation_id = data.env0_template.this.github_installation_id
  bitbucket_client_key   = data.env0_template.this.bitbucket_client_key
  gitlab_project_id      = data.env0_template.this.gitlab_project_id
  is_azure_devops        = data.env0_template.this.is_azure_devops
}

