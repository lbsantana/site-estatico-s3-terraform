data "aws_s3_bucket" "StaticSite" {
    filter {
        name   = "bucket-name"
        values = [var.static_site.bucket_name]
    }
}

