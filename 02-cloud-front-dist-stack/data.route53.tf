data "aws_route53_zone" "this" {
  name         = "cloudiq.com.br"
  private_zone = false
}
