include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../tf-modules/gcp/static-ips/"

  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

     arguments = [
      "-var-file=${get_terragrunt_dir()}/../_env_defaults/gcp.tfvars",
     ]
  }
}

inputs = {
  name = "dev-nat"
  number_of_ips = 1
  labels = {
    purpose = "nat",
    environment = "dev",
    managedby = "terraform"
  }
}
