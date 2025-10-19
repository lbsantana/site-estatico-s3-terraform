resource "aws_acm_certificate" "cloudiq_cert" {
  domain_name       = var.acm_certificate.domain_name
  subject_alternative_names = var.acm_certificate.subject_alternative_names
  validation_method = "DNS"

  tags = var.tags 

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_route53_zone" "this" {
  name         = "cloudiq.com.br"
  private_zone = false
}

resource "aws_route53_record" "cloudiq_cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cloudiq_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.this.zone_id
}

resource "aws_acm_certificate_validation" "cloudiq_cert_validation_complete" {

  certificate_arn         = aws_acm_certificate.cloudiq_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cloudiq_cert_validation : record.fqdn]
}