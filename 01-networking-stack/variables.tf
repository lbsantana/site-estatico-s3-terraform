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

variable "static_site" {
  type = object({
    bucket_name        = string
    website_index_file = string
    website_error_file = string
    acl                = string
  })

  default = {
    bucket_name        = "static-site-365827924923"
    website_index_file = "index.html"
    website_error_file = "404.html"
    acl                = "private"
  }
}