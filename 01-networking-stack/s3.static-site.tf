resource "aws_s3_bucket" "StaticSite" {
  bucket             = var.static_site.bucket_name
  acl                = "private"


  tags = { Name = var.static_site.bucket_name }
    
  website {
    index_document = var.static_site.website_index_file
    error_document = var.static_site.website_error_file
  }
}

resource "aws_s3_bucket_versioning" "StaticSite" {
  bucket = aws_s3_bucket.StaticSite.id

  versioning_configuration {
    status = "Enabled"
  }
}