output "deployer_arn" {
  value       = module.assume-role.env0_deployer_role.arn
  description = "deployer role"
}

output "cost_role_arn" {
  value       = module.assume-role.env0_cost_role.arn
  description = "cost role"
}