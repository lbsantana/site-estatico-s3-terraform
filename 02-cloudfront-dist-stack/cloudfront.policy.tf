data "aws_iam_policy_document" "cloudfront_access" {
  statement {
    effect  = "Allow"
    actions = ["s3:GetObject"]
    resources = ["${data.aws_s3_bucket.this.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.this.arn]
    }
  }
}

resource "aws_s3_bucket_policy" "allow_cloudfront_access" {
  bucket = data.aws_s3_bucket.this.bucket
  policy = data.aws_iam_policy_document.cloudfront_access.json
}
