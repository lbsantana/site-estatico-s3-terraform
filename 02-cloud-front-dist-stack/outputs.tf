output "cdn_url" {
  value = "https://${aws_cloudfront_distribution.this.domain_name}"
}
