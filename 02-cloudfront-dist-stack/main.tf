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