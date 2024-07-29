locals {
  modules_dir = "modules"

  # this file (env0.system-env-vars.json) comes from the env0 runtime
  env_vars = jsondecode(file("env0.system-env-vars.json"))
}

data "env0_environment" "this" {
  id = local.env_vars.ENV0_ENVIRONMENT_ID
}

data "env0_template" "this" {
  id = local.env_vars.ENV0_TEMPLATE_ID
}