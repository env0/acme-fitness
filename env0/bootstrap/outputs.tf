output "deployer_arn" {
  value       = module.assume-role.deployer_arn
  description = "deployer role"
}

output "cost_role_arn" {
  value       = module.assume-role.cost_role_arn
  description = "cost role"
}

output "ssh_public_key" {
  value = module.github-sshkey.env0_ssh_public_key
}
output "ssh_private_key" {
  value     = module.github-sshkey.env0_ssh_private_key
  sensitive = true
}