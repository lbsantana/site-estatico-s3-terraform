data "aws_acm_certificate" "this" {
  domain   = "cloudiq.com.br"
  statuses = ["ISSUED"]
  most_recent = true
}