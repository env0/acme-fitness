
resource "env0_template" "modules" {
  for_each = var.templates

  name                   = each.key
  description            = each.value.description
  type                   = each.value.type
  repository             = var.repo
  path                   = each.value.path
  github_installation_id = var.github_installation_id
}
