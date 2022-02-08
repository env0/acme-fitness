terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.74.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
    env0 = {
      source = "env0/env0"
      version = ">= 0.2.26"
    }
  }
}

resource "tls_private_key" "throwaway" {
  algorithm = "RSA"
}

output "public_key_you_need_to_add_to_github_ssh_keys" {
  value = tls_private_key.throwaway.public_key_openssh
}

resource "env0_ssh_key" "tested" {
  name  = "test key"
  value = tls_private_key.throwaway.private_key_pem
}