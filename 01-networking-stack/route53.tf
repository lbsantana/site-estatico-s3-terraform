resource "aws_route53_zone" "this" {
  name          = var.route53_certificate.name
  comment       = var.route53_certificate.comment
  force_destroy = true
  tags          = var.tags
}

