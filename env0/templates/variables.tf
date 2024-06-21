variable "repo" {
  type    = string
  default = "https://github.com/env0/acme-fitness"
}

variable "github_installation_id" {
  type        = string
  description = "the integration app id"
}

variable "templates" {
  type = map(
    object({
      type        = string
      path        = string
      description = string
    })
  )

  description = "list of templates"
  default = {
    ec2 = {
      type = "opentofu"
      path = "modules/ec2"
      description = "standard ec2 instance"
    }
    s3 = {
      type = "opentofu"
      path = "modules/s3"
      description = "simple private s3 bucket"
    }
    vpc = {
      type = "opentofu"
      path = "modules/vpc"
      description = "random id or default vpc"
    }
  }
}