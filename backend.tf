# The block below configures Terraform to use the 'remote' backend with Terraform Cloud.
# For more information, see https://www.terraform.io/docs/backends/types/remote.html
terraform {
  backend "remote" {
#    hostname = "app.terraform.io"
    organization = "example-org-5c40a9"

    workspaces {
      name = "terraform-netology"
    }
  }

  required_version = ">= 0.13.0"
}
