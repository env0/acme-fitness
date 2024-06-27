# taking advantage of some tricks in env0
locals {
  env_vars = jsondecode(file("env0.system-env-vars.json"))
}

# Create Assume Role
module "pet-name" {
  source = "../../modules/random_pet"
}

module "assume-role" {
  source = "../credentials/assume-role"

  # optional
  assume_role_name      = "env0-deployer-role-${module.pet-name.name}"
  cost_assume_role_name = "env0-cost-role-${module.pet-name.name}"
}

data "env0_environment" "this" {
  id = local.env_vars.ENV0_ENVIRONMENT_ID
}

data "env0_template" "this" {
  id = local.env_vars.ENV0_TEMPLATE_ID
}

# Create GitHub SSH Key
# module "github-sshkey" {
#   source = "../credentials/ssh"
#   # optional
#   key_name = "env0 GitHub key"
# }

# Create default env0 Projects with Policies

# module "env0-projects" {
#   source = "../projects"

#   projects = {
#     dev = {
#       name        = "Dev"
#       description = "is back for more exciting Infrastructure as Code work"
#       credential  = "env0-deployer-role"
#       policy = {
#         disable_destroy_environments  = false
#         include_cost_estimation       = true
#         number_of_environments        = "5"
#         number_of_environments_total  = "10"
#         requires_approval_default     = false
#         skip_apply_when_plan_is_empty = true
#         skip_redundant_deployments    = true
#         continuous_deployment_default = true
#         run_pull_request_plan_default = false
#       }
#     },
#     prod = {
#       name        = "Prod"
#       description = "We're in production!"
#       credential  = "env0-deployer-role"
#       policy = {
#         disable_destroy_environments  = true
#         include_cost_estimation       = true
#         number_of_environments        = null
#         number_of_environments_total  = null
#         requires_approval_default     = true
#         skip_apply_when_plan_is_empty = true
#         skip_redundant_deployments    = true
#         continuous_deployment_default = true
#         run_pull_request_plan_default = true
#       }
#     }
#   }
# }

