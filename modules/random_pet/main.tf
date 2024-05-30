resource "random_pet" "name" {
  length = 1

  keepers = {
    generic_keeper = var.keeper
  }
  # # https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle
  # lifecycle {
  #   create_before_destroy = true
  # }
}