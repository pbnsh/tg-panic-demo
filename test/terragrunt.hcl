include "root" {
  path = find_in_parent_folders("root.hcl")
}

locals {
  config = read_terragrunt_config("${get_repo_root()}/modules/test/module.hcl")
}

terraform {
  source = local.config.locals.source
}

generate = local.config.generate
inputs   = local.config.inputs
