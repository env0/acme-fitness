terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

provider "random" {
  # Configuration options
}