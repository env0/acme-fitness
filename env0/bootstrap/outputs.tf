output "deployer_arn" {
  value       = module.assume-role.deployer_arn
  description = "deployer role"
}

output "cost_role_arn" {
  value       = module.assume-role.cost_role_arn
  description = "cost role"
}
