### This file consumes resources created from env0_projects.tf

resource "env0_environment" "default_projects" {
  for_each = toset(var.default_projects)

  name                       = "${each.key} Project"
  project_id                 = data.env0_environment.this.project_id
  template_id                = env0_template.projects.id
  approve_plan_automatically = true
  is_remote_backend          = true
  removal_strategy           = "mark_as_archived"
  workspace                  = "${each.key}_project"

  configuration {
    name        = "team_name"
    value       = each.key
    type        = "terraform"
    description = "main project name for team"
    regex       = "[a-zA-Z0-9-_]*"
    is_required = true
  }

  depends_on = [env0_configuration_variable.team_name,
    env0_configuration_variable.team_environments,
    env0_configuration_variable.environment_policies,
    env0_template_project_assignment.projects,
    env0_api_key.mgmt]

  lifecycle {
    ignore_changes = [
      variable_sets
    ]
  }
}