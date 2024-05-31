
resource "random_id" "vpc" {
  count       = (var.getRealVPC) ? 0 : 1
  byte_length = 5
}

data "aws_vpc" "this" {
  count   = (var.getRealVPC) ? 1 : 0
  default = true
}