resource "aws_s3_bucket" "website_bucket" {
  bucket = "theramya10"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.website_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.website_bucket.id
  rule {
    id = "move-to-glacier"
    status = "Enabled"
    transition {
      days          = 30
      storage_class = "GLACIER"
    }
  }
}