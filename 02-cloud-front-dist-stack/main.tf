terraform {

    backend "s3" {
    bucket       = "remote-backend-365827924923"
    key          = "cloudfront/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.auth.region

  default_tags {
    tags = var.tags
  }

  assume_role {
    role_arn = var.auth.assume_role_arn
  }
}

data "terraform_remote_state" "networking" {
  backend = "s3"
  config = {
    bucket = "remote-backend-365827924923"
    key    = "networking/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "static_site" {
  backend = "s3"
  config = {
    bucket = "remote-backend-365827924923"
    key    = "static-site/terraform.tfstate"
    region = "us-east-1"
  }
}