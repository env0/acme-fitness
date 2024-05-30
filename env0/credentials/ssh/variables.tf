locals {
  SUPPORTED_VCS = ["GitHub"]
}

variable "vcs" {
  type    = string
  default = "GitHub"

  validation {
    condition     = contains(local.SUPPORTED_VCS, var.vcs)
    error_message = "Must be one ${local.SUPPORTED_VCS}"
  }
}


variable "key_name" {
  type        = string
  default     = "env0 SSH Key"
  description = "Used both in VCS and env0 names"
}