terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.2"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_id" "vpc" {
  byte_length = 8
}

output "vpc_id" {
  value = "vpc-${random_id.vpc.hex}"
}