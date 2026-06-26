terraform {
  required_version = ">= 1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "cmoperations2026s1-terraform-state"
    key            = "cmoperations2026s1/storage/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-locks"
    use_lockfile   = false
    profile        = "terraform-admin"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "terraform-admin"

  default_tags {
    tags = {
      ManagedBy    = "Terraform"
      Environment  = "management"
      Project      = "cmoperations2026s1"
      Concern      = "storage"
      TerraformKey = "cmoperations2026s1/storage/terraform.tfstate"
    }
  }
}
