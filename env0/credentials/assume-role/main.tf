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
      source  = "env0/env0"
      version = ">= 0.2.26"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

variable "assume_role_name" {
  type        = string
  default     = "env0-deployer-role"
  description = "name used for both env0 and AWS"
}

resource "aws_iam_role" "env0_deployer_role" {
  name = var.assume_role_name

  max_session_duration = 18000

  # Change to your policy
  managed_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess", ]

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::913128560467:root"
        },
        "Action" : "sts:AssumeRole",
        "Condition" : {
          "StringEquals" : {
            "sts:ExternalId" : "${random_string.externalid.result}"
          }
        }
      }
    ]
  })

  tags = {
    note = "Created through env0 Bootstrap"
  }
}

resource "random_string" "externalid" {
  length  = 32
  upper   = true
  special = false
}

resource "env0_aws_credentials" "credentials" {
  name        = var.assume_role_name
  arn         = aws_iam_role.env0_deployer_role.arn
  external_id = random_string.externalid.result
}

output "externalid" {
  value     = random_string.externalid.result
  sensitive = true
}