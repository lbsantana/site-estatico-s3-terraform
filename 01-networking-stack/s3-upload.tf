locals {
  static_files = fileset("${path.module}/../APP/Frontend", "**")
}

resource "aws_s3_object" "frontend_files" {
  for_each = { for file in local.static_files : file => file }

  bucket = var.static_site.bucket_name

  key = replace(each.value, "APP/Frontend/", "")

  source = "${path.module}/../APP/Frontend/${each.value}"
  etag   = filemd5("${path.module}/../APP/Frontend/${each.value}")

  content_type = lookup(
    {
      html = "text/html",
      css  = "text/css",
      js   = "application/javascript",
      json = "application/json",
      png  = "image/png",
      jpg  = "image/jpeg",
      jpeg = "image/jpeg",
      svg  = "image/svg+xml",
      ico  = "image/x-icon",
      txt  = "text/plain"
    },
    element(split(".", each.value), length(split(".", each.value)) - 1),
    "application/octet-stream"
  )
}
