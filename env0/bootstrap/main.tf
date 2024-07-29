# taking advantage of some tricks in env0
locals {
  
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

# Create GitHub SSH Key
# module "github-sshkey" {
#   source = "../credentials/ssh"
#   # optional
#   key_name = "env0 GitHub key"
# }