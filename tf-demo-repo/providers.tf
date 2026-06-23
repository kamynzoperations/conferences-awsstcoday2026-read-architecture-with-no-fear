provider "aws" {
  region  = var.aws_region
  profile = "terraform-operator" # explicit profile, not inherited
}

provider "aws" {
  alias   = "us_east_1"
  region  = "us-east-1"
  profile = "terraform-operator"

  default_tags {
    tags = {
      ManagedBy    = "Terraform"
      Environment  = "demos"
      Project      = "demo-repo"
      Concern      = "demo-repo"
      TerraformKey = "cmoperations2026s1/demo-repo/terraform.tfstate"
    }
  }
}
