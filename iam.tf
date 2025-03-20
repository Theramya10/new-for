# Fetch existing S3 bucket
data "aws_s3_bucket" "existing_bucket" {
  bucket = "theramya10"
}

# Create CloudFront Origin Access Identity (OAI)
resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for S3 bucket theramya10"
}

# S3 Bucket Policy to Allow CloudFront Access
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = data.aws_s3_bucket.existing_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = { AWS = aws_cloudfront_origin_access_identity.oai.iam_arn },
        Action    = "s3:GetObject",
        Resource  = "${data.aws_s3_bucket.existing_bucket.arn}/My1stWEB/*"
      }
    ]
  })
}
