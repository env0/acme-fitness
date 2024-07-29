resource "env0_module" "vpc" {
  module_name         = "vpc-test-2"
  repository          = data.env0_template.this.repository
  path                = "modules/vpc"
  tag_prefix          = "vpc"
  module_test_enabled = true
  opentofu_version    = "latest"

  # vcs
  # vcs configuration
  github_installation_id = var.vcs == "github" ? data.env0_template.this.github_installation_id : null
  bitbucket_client_key   = var.vcs == "bitbucket" ? data.env0_template.this.bitbucket_client_key : null
  # gitlab_project_id    = data.env0_template.this.gitlab_project_id
  is_azure_devops = var.vcs == "azure" ? data.env0_template.this.is_azure_devops : null
  token_id        = var.vcs == "gitlab" || var.vcs == "azure" ? data.env0_template.this.token_id : null
  #token_name      = var.vcs == "gitlab" ? data.env0_template.this.token_name : null
}