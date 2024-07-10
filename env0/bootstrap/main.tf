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

