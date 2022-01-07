terraform {
  required_providers {
    env0 = {
      source  = "env0/env0"
      version = "0.0.22"
    }
  }
  experiments = [module_variable_optional_attrs]
}

provider "env0" {
}

# create the project with the name and description
resource "env0_project" "project" {
  for_each    = var.projects
  name        = each.value.name
  description = each.value.description
}

# configure the policy for each project
resource "env0_project_policy" "policy" {
  for_each                      = var.projects
  project_id                    = env0_project.project[each.key].id
  continuous_deployment_default = each.value.policy.continuous_deployment_default
  disable_destroy_environments  = each.value.policy.disable_destroy_environments
  include_cost_estimation       = each.value.policy.include_cost_estimation
  number_of_environments        = each.value.policy.number_of_environments
  number_of_environments_total  = each.value.policy.number_of_environments_total
  requires_approval_default     = each.value.policy.requires_approval_default
  run_pull_request_plan_default = each.value.policy.run_pull_request_plan_default
  skip_apply_when_plan_is_empty = each.value.policy.skip_apply_when_plan_is_empty
  skip_redundant_deployments    = each.value.policy.skip_redundant_deployments

  depends_on = [
    env0_project.project
  ]
}

# using the data resource to get the credential ID
data "env0_aws_credentials" "credentials" {
  for_each = var.projects
  name     = each.value.credential
}

# configure the project with the proper credentials
resource "env0_cloud_credentials_project_assignment" "credential_project" {
  for_each      = var.projects
  project_id    = env0_project.project[each.key].id
  credential_id = data.env0_aws_credentials.credentials[each.key].id
  depends_on = [
    env0_project.project,
    data.env0_aws_credentials.credentials
  ]
}

###
#  projects variable split into four main fields
#    * name (string) - the name of the project as shown in the UI
#    * description (string) - the description of the project as shown in the UI
#    * credential (string) - the name of the credential (AWS Assume Role) assigned to the Project
#    * policy (object) - the project policy settings
###
variable "projects" {
  type = map(
    object({
      name        = string
      description = string
      credential  = string
      policy = object({
        continuous_deployment_default = optional(bool)
        disable_destroy_environments  = bool
        include_cost_estimation       = bool
        number_of_environments        = string
        number_of_environments_total  = string
        requires_approval_default     = bool
        run_pull_request_plan_default = bool
        skip_apply_when_plan_is_empty = bool
        skip_redundant_deployments    = bool
      })
    })
  )
  description = "map of object with names, descriptions, credentials and policies e.g. {dev0={name=\"dev\",description=\"this is my dev project\",credential=\"aws dev\",policy=local.devpolicy}}"
}

output "project" {
  value = {
    for k, v in var.projects : k => [v.name, v.description, v.credential]
  }
}