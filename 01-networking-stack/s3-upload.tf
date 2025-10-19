locals {
  # Caminho da pasta buildada do seu Frontend
  static_files = fileset("${path.module}/APP/Frontend/dist", "**")
}

# Faz o upload dos arquivos locais para a bucket EXISTENTE
resource "aws_s3_object" "frontend_files" {
  for_each = { for file in local.static_files : file => file }

  # 👇 Aqui usamos o nome da bucket já existente na AWS
  bucket = var.static_site.bucket_name

  key    = each.value
  source = "${path.module}/APP/Frontend/dist/${each.value}"
  etag   = filemd5("${path.module}/APP/Frontend/dist/${each.value}")

  # Define o tipo de conteúdo correto (HTML, CSS, JS, imagens, etc.)
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
