variable "team_name" {
  description = "Name of the team"
  type        = string
  default     = "Skunkworks"
}

variable "team_environments" {
  description = "List of team environments"
  type        = list(string)
  default     = [ "Dev", "Stage", "Prod" ]
}

variable "policies" {
  description = "Policies in JSON format"
  type        = map(any)
  default     = {
    Dev = {
      number_of_environments        = 3
      number_of_environments_total  = 10
      requires_approval_default     = false
      include_cost_estimation       = true
      skip_apply_when_plan_is_empty = true
      disable_destroy_environments  = false
      skip_redundant_deployments    = true
    }
    Stage = {
      requires_approval_default     = false
      include_cost_estimation       = true
      skip_apply_when_plan_is_empty = true
      disable_destroy_environments  = false
      skip_redundant_deployments    = true
    }
    Prod = {
      requires_approval_default     = true
      include_cost_estimation       = true
      skip_apply_when_plan_is_empty = true
      disable_destroy_environments  = true
      skip_redundant_deployments    = true
    }
  }
}