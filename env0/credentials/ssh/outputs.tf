output "env0_ssh_public_key" {
  value = tls_private_key.github_key.public_key_openssh
}

output "env0_ssh_private_key" {
  value     = tls_private_key.github_key.private_key_pem
  sensitive = true
}
