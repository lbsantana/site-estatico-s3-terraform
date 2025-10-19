resource "aws_s3_bucket" "StaticSite" {
  bucket = var.static_site.bucket_name
  website_index_file = "index.html"
  website_error_file = "404.html"
  acl    = "private"


  tags = { Name = var.static_site.bucket_name }
}

resource "aws_s3_bucket_versioning" "StaticSite" {
  bucket = aws_s3_bucket.StaticSite.id

  versioning_configuration {
    status = "Enabled"
  }
}