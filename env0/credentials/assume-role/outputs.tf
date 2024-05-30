output "deployer_arn" {
  value       = aws_iam_role.env0_deployer_role.arn
  description = "deployer role"
}

output "cost_role_arn" {
  value = aws_iam_role.env0_cost_role.arn
}