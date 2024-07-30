terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.2"
    }
    env0 = {
      source = "env0/env0"
    }
  }
}

# provider "env0" {
#   # env0 Provider expects to find the environment variables defined.
#   # to create an API key see:  https://docs.env0.com/docs/api-keys
#   # ENV0_API_KEY    
#   # ENV0_API_SECRET
# }

provider "aws" {
  region = var.region
}