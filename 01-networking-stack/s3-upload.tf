locals {
  # Lista recursiva de todos os arquivos do site
  static_files = fileset("${path.module}/APP/Frontend/dist", "**")
}

resource "aws_s3_object" "frontend_files" {
  for_each = { for file in local.static_files : file => file }

  bucket = aws_s3_bucket.StaticSite.bucket
  key    = each.value
  source = "${path.module}/APP/Frontend/dist/${each.value}"
  etag   = filemd5("${path.module}/APP/Frontend/dist/${each.value}")

  # Define o Content-Type automaticamente com base na extensão
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
