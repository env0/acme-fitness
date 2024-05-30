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
resource "random_string" "backend" {
  keepers = {
    refresh_date = var.refresh_date
  }
  length  = 5
  upper   = true
  special = false
}

output "backend_name" {
  value = "backend-${random_string.backend.result}"
}