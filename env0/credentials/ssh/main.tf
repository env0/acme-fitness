resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "github_user_ssh_key" "this" {
  title = var.key_name
  key   = tls_private_key.this.public_key_openssh
}

resource "env0_ssh_key" "this" {
  name  = var.key_name
  value = tls_private_key.this.private_key_pem
}
