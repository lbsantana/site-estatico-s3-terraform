resource "aws_s3_bucket" "StaticSite" {
  bucket = var.static_site.bucket_name

  tags   = { Name = var.static_site.bucket_name }
}

resource "aws_s3_bucket_versioning" "StaticSiteVersioning" {
  bucket = aws_s3_bucket.StaticSite.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_website_configuration" "StaticSiteWebsite" {
  bucket   = aws_s3_bucket.StaticSite.id

  index_document {
    suffix = var.static_site.website_index_document
  }

  error_document {
    key   = var.static_site.website_error_document
  }
}

resource "aws_s3_bucket_public_access_block" "StaticSitePublicBlock" {
  bucket                  = aws_s3_bucket.StaticSite.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
