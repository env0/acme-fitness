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

variable "create_templates" {
  type        = bool
  description = "create default templates"
  default     = true
}

variable "vcs" {
  type        = string
  description = "github, gitlab, azure, bitbucket"
  default     = "github"
  validation {
    condition     = contains(["github", "gitlab", "azure", "bitbucket"], var.vcs)
    error_message = "vcs must be one of github, gitlab, azure, bitbucket"
  }
}