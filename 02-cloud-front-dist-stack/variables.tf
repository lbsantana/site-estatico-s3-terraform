variable "auth" {
  type = object({
    region          = string
    assume_role_arn = string
  })

  default = {
    assume_role_arn = "arn:aws:iam::365827924923:role/StaticSiteRole"
    region          = "us-east-1"
  }
}

variable "tags" {
  type = map(string)
  default = {
    "Project"     = "site-estatico-s3-terraform"
    "Environment" = "production"
  }
}

variable "route53_zone_name" {
  type    = object({
    name    = string
    name = string
  })

  default = {
    name    = "cloudiq.com.br"
    name = "www.cloudiq.com.br"
  }
}