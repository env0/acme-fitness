terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.20.0"
    }
    env0 = {
      source  = "env0/env0"
      version = ">= 0.2.26"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 3.1.0"
    }
  }
}

provider "github" {
  # Change to your owner
  # Set your PAT or GitHub App environment variables e.g. GITHUB_TOKEN
  # https://registry.terraform.io/providers/integrations/github/latest/docs#authentication
  owner = "env0-poc"
}

variable "key_name" {
  type        = string
  default     = "env0 GitHub SSH Key"
  description = "Used both in GitHub and env0 names"
}

resource "github_user_ssh_key" "github_key" {
  title = var.key_name
  key   = tls_private_key.github_key.public_key_openssh
}

resource "tls_private_key" "github_key" {
  algorithm = "RSA"
}

resource "env0_ssh_key" "github" {
  name  = var.key_name
  value = tls_private_key.github_key.private_key_pem
}

output "env0_github_public_key" {
  value = tls_private_key.github_key.public_key_openssh
}

output "env0_github_private_key" {
  value     = tls_private_key.github_key.private_key_pem
  sensitive = true
}
