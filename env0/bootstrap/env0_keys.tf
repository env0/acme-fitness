resource "env0_api_key" "mgmt" {
  name = "control plane"
}

resource "env0_variable_set" "env0_keys" {
  name        = "Control-ENV0_API_KEY"
  description = "mgmt api key - control plane org api key"
  scope       = "project"
  scope_id    = data.env0_environment.this.project_id

  variable {
    name  = "ENV0_API_KEY"
    value = env0_api_key.mgmt.api_key_id
    type  = "environment"
  }

  variable {
    name         = "ENV0_API_SECRET"
    value        = env0_api_key.mgmt.api_key_secret
    type         = "environment"
    is_sensitive = true
  }
}

resource "env0_variable_set_assignment" "env0_keys" {
  scope    = "project"
  scope_id = data.env0_environment.this.project_id
  set_ids  = [env0_variable_set.env0_keys.id]
}