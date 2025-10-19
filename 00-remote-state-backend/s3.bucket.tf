resource "aws_s3_bucket" "Backend_Remote" {
  bucket = var.Backend_Remote.bucket_name

  tags = { Name = var.Backend_Remote.bucket_name }
}

resource "aws_s3_bucket_versioning" "Backend_Remote" {
  bucket = aws_s3_bucket.Backend_Remote.id

  versioning_configuration {
    status = "Enabled"
  }
}