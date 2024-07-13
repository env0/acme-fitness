output "deployer_arn" {
  value       = module.assume-role.deployer_arn
  description = "deployer role"
}

output "cost_role_arn" {
  value       = module.assume-role.cost_role_arn
  description = "cost role"
}

output "github_installation_id" {
  value       = data.env0_template.this.github_installation_id
  description = "GitHub Installation Id"
}

output "bitbucket_client_key" {
  value       = data.env0_template.this.bitbucket_client_key
  description = "BitBucket Client Key"
}

# output "gitlab_project_id" {
#   value = data.env0_template.this.gitlab_project_id
#   description = "GitLab Project Id"
# }

output "token_id" {
  value       = data.env0_template.this.token_id
  description = "Azure DevOps or GitLab Token Id"
}

output "is_azure_devops" {
  value       = data.env0_template.this.is_azure_devops
  description = "is Azure DevOps"
}

