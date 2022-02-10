# Create Assume Role
module "assume-role" {
  source = "../credentials/assume-role"

  # optional
  assume_role_name = "env0-deployer-role"
}

# Create GitHub SSH Key
module "github-sshkey" {
  source = "../credentials/ssh"

  # optional
  key_name = "env0 GitHub key"
}