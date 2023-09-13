terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.16.0"
    }
    env0 = {
      source  = "env0/env0"
      version = "~> 1.14"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

variable "assume_role_name" {
  type        = string
  default     = "env0-deployer-role"
  description = "name used for AWS"
}

variable "orgid" {
  type        = string
  description = "your env0 org id (you can find it under organization > settings)"
}

resource "aws_iam_role" "env0_deployer_role" {
  name = var.assume_role_name

  max_session_duration = 18000  # default configuration for env0 is 5 hours (do not modify)

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
            "sts:ExternalId" : "${var.orgid}"
          }
        }
      }
    ]
  })

  tags = {
    note = "Created through env0 Bootstrap"
  }
}

resource "env0_aws_credentials" "credentials" {
  name = aws_iam_role.env0_deployer_role.arn
  arn  = aws_iam_role.env0_deployer_role.arn
}

output "aws_iam_role_arn" {
  value = aws_iam_role.env0_deployer_role.arn
}