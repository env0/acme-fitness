variable "team_name" {
  description = "Name of the team"
  type        = string
  default     = "Skunkworks"
}

variable "team_environments" {
  description = "List of team environments"
  type        = list(string)
  default     = ["Dev", "Stage", "Prod"]
}

variable "policies" {
  description = "Policies in JSON format"
  type = map(object({
    disable_destroy_environments  = optional(bool)
    number_of_environments        = optional(number)
    number_of_environments_total  = optional(number)
    requires_approval_default     = optional(bool)
    default_ttl                   = optional(string)
    max_ttl                       = optional(string)
    include_cost_estimation       = optional(bool)
    skip_apply_when_plan_is_empty = optional(bool)
    skip_redundant_deployments    = optional(bool)
    continuous_deployment_default = optional(bool)
    run_pull_request_plan_default = optional(bool)
    force_remote_backend          = optional(bool)
    drift_detection_cron          = optional(string)
  }))
  default = {
    Dev = {
      disable_destroy_environments  = false
      number_of_environments        = 3
      number_of_environments_total  = 10
      requires_approval_default     = false
      default_ttl                   = "12-h"
      max_ttl                       = "1-w"
      include_cost_estimation       = true
      skip_apply_when_plan_is_empty = true
      skip_redundant_deployments    = true
      continuous_deployment_default = true
      run_pull_request_plan_default = true
      force_remote_backend          = true
      drift_detection_cron          = "0 1 * * *"
    }
    Stage = {
      disable_destroy_environments  = false
      number_of_environments        = null
      number_of_environments_total  = null
      requires_approval_default     = false
      default_ttl                   = null
      max_ttl                       = null
      include_cost_estimation       = true
      skip_apply_when_plan_is_empty = true
      skip_redundant_deployments    = true
      continuous_deployment_default = true
      run_pull_request_plan_default = true
      force_remote_backend          = true
      drift_detection_cron          = "0 3 * * 7"
    }
    Prod = {
      disable_destroy_environments  = false
      number_of_environments        = null
      number_of_environments_total  = null
      requires_approval_default     = false
      default_ttl                   = null
      max_ttl                       = null
      include_cost_estimation       = true
      skip_apply_when_plan_is_empty = true
      skip_redundant_deployments    = true
      continuous_deployment_default = true
      run_pull_request_plan_default = true
      force_remote_backend          = true
      drift_detection_cron          = "0 5 * * 7"
    }
  }
}

variable "default_templates" {
  type        = list(string)
  description = "list of templates to add to project"
  default     = ["vpc", "ec2", "s3", "random_pet"]
}