output "instances" {
  value = module.acme-ec2.id
}

output "private_ip" {
  value = module.acme-ec2.private_ip
}