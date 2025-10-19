output "s3_bucket_name" {
  value = aws_s3_bucket.StaticSite.id
}

output "s3_bucket_website_url" {
  value = "http://${aws_s3_bucket.StaticSite.bucket_regional_domain_name}"
  }

output "s3_bucket_arn" {
  value = aws_s3_bucket.StaticSite.arn
}

output "acm_certificate_arn" {
  value = aws_acm_certificate.cloudiq_cert.arn
}

output "acm_certificate_domain_name" {
  value = aws_acm_certificate.cloudiq_cert.domain_name
}