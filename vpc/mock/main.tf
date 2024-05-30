terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "random" {
  # Configuration options
}
variable "refresh_date" {
  type    = string
  default = "00/00/0000"
}
resource "random_id" "vpc" {
  keepers = {
    refresh_date = var.refresh_date
  }
  byte_length = 8
}

output "vpc_id" {
  value = "vpc-${random_id.vpc.hex}"
}