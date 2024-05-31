output "vpc_id" {
  value = (var.getRealVPC) ? data.aws_vpc.this[0].id : "vpc-${random_id.vpc[0].hex}"
}