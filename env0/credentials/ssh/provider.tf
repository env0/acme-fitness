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
  owner = "env0-away-dev"
}