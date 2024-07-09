# variable "github" {
#   type        = bool
#   description = "using GitHub SaaS"
#   default     = true
# }

variable "create_projects" {
  type        = bool
  description = "create default projects"
  default     = true
}

variable "default_team_name" {
  type        = string
  description = "Default Project Name"
  default     = "Skunkworks"
}