data "aws_acm_certificate" "cloudiq_cert" {
  domain   = var.acm_domain_name
  statuses = ["ISSUED"]
  most_recent = true
}