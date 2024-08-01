# variable "github" {
#   type        = bool
#   description = "using GitHub SaaS"
#   default     = true
# }

variable "default_projects" {
  type        = list(string)
  description = "if empty (do not create projects), otherwise, create list of default projects"
  default     = ["Skunkworks", "Phoenix", "Unicorn"]
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