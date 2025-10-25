locals {
  source = "${get_repo_root()}//modules/test"
  inputs = yamldecode(file("${get_original_terragrunt_dir()}/inputs.yaml"))
}

generate "module" {
  path      = "main.tf"
  if_exists = "overwrite"
  contents  = <<-EOT
  variable "debug" {
    type    = string
  }
  output "debug" {
    value = var.debug
  }
  EOT
}

inputs = local.inputs
