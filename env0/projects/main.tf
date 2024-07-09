resource "env0_project" "team_project" {
  name        = var.team_name
  description = "Team project for ${var.team_name}"
}

resource "env0_project" "environment_projects" {
  for_each = toset(var.team_environments)

  name              = each.value
  description       = "${each.value} environment for ${var.team_name} project"
  parent_project_id = env0_project.team_project.id
}

resource "env0_project_policy" "environment_policies" {
  for_each = toset(var.team_environments)

  project_id                    = env0_project.environment_projects[each.key].id
  disable_destroy_environments  = var.policies[each.key].disable_destroy_environments
  number_of_environments        = var.policies[each.key].number_of_environments
  number_of_environments_total  = var.policies[each.key].number_of_environments_total
  requires_approval_default     = var.policies[each.key].requires_approval_default
  default_ttl                   = var.policies[each.key].default_ttl
  max_ttl                       = var.policies[each.key].max_ttl
  include_cost_estimation       = var.policies[each.key].include_cost_estimation
  skip_apply_when_plan_is_empty = var.policies[each.key].skip_apply_when_plan_is_empty
  skip_redundant_deployments    = var.policies[each.key].skip_redundant_deployments
  continuous_deployment_default = var.policies[each.key].continuous_deployment_default
  run_pull_request_plan_default = var.policies[each.key].run_pull_request_plan_default
  force_remote_backend          = var.policies[each.key].force_remote_backend
  drift_detection_cron          = var.policies[each.key].drift_detection_cron
}