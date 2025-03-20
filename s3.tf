resource "aws_s3_bucket" "website_bucket" {
  bucket = "theramya10"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.website_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
