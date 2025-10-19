resource "aws_route53_record" "root" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = var.route53_zone_name.name
  type    = "A"

    alias {
        name                   = aws_cloudfront_distribution.this.domain_name
        zone_id                = aws_cloudfront_distribution.this.hosted_zone_id
        evaluate_target_health = false
    }

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = var.route53_zone_name.name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.this.domain_name
    zone_id                = aws_cloudfront_distribution.this.hosted_zone_id
    evaluate_target_health = false
  }
}
