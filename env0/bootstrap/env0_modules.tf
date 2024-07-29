# locals {
#   aws_modules = ["vpc", "ec2", "s3", "eks_data"]
# }

# resource "env0_module" "aws" {
#   for_each = toset(local.aws_modules)

#   module_name         = each.key
#   module_provider     = "aws"
#   repository          = data.env0_template.this.repository
#   path                = "${local.modules_dir}/${each.key}"
#   tag_prefix          = each.key
#   module_test_enabled = true
#   opentofu_version    = "latest"

#   # vcs
#   # vcs configuration
#   github_installation_id = var.vcs == "github" ? data.env0_template.this.github_installation_id : null
#   bitbucket_client_key   = var.vcs == "bitbucket" ? data.env0_template.this.bitbucket_client_key : null
#   # gitlab_project_id    = data.env0_template.this.gitlab_project_id
#   is_azure_devops = var.vcs == "azure" ? data.env0_template.this.is_azure_devops : null
#   token_id        = var.vcs == "gitlab" || var.vcs == "azure" ? data.env0_template.this.token_id : null
#   #token_name      = var.vcs == "gitlab" ? data.env0_template.this.token_name : null
# }

resource "env0_module" "aws" {
  module_name         = "s3_test"
  module_provider     = "aws"
  repository          = data.env0_template.this.repository
  path                = "modules/s3"
  tag_prefix          = "s3"

  # vcs
  # vcs configuration
  github_installation_id = var.vcs == "github" ? data.env0_template.this.github_installation_id : null
  bitbucket_client_key   = var.vcs == "bitbucket" ? data.env0_template.this.bitbucket_client_key : null
  # gitlab_project_id    = data.env0_template.this.gitlab_project_id
  is_azure_devops = var.vcs == "azure" ? data.env0_template.this.is_azure_devops : null
  token_id        = var.vcs == "gitlab" || var.vcs == "azure" ? data.env0_template.this.token_id : null
  #token_name      = var.vcs == "gitlab" ? data.env0_template.this.token_name : null
}