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
    website_index_document = string
    website_error_document = string
  })

  default = {
    bucket_name        = "static-site-365827924923"
    website_index_document = "index.html"
    website_error_document = "404.html"
  }
}

variable "acm_certificate" {
  type = object({
    domain_name               = string
    subject_alternative_names = list(string)
  })

  default = {
    domain_name               = "cloudiq.com.br"
    subject_alternative_names = ["*.cloudiq.com.br"]
  }
}

variable "route53_certificate" {
  type = object({
    name               = string
    comment            = string
  })

  default = {
    name               = "cloudiq.com.br"
    comment = "Public hosted zone for CloudIQ site"
  }
}