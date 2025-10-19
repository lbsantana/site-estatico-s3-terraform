data "aws_route53_zone" "this" {
  name         = var.route53_certificate.zone_name
  private_zone = true
}