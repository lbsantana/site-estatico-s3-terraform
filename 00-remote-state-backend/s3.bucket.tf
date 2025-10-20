resource "aws_s3_bucket" "backend_remote_state" {
  bucket = var.backend_remote_state.bucket_name

  tags   = { Name = var.backend_remote_state.bucket_name }
}

resource "aws_s3_bucket_versioning" "backend_remote_state" {
  bucket = aws_s3_bucket.backend_remote_state.id

  versioning_configuration {
    status = "Enabled"
  }
}