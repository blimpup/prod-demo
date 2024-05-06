resource "aws_s3_bucket" "resourcely-test_mVARAaTQmZzfM79L" {
  bucket = "test"
}

resource "aws_s3_bucket_public_access_block" "resourcely-test_mVARAaTQmZzfM79L" {
  bucket                  = aws_s3_bucket.resourcely-test_mVARAaTQmZzfM79L.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "resourcely-test_mVARAaTQmZzfM79L" {
  bucket = aws_s3_bucket.resourcely-test_mVARAaTQmZzfM79L.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_versioning" "resourcely-test_mVARAaTQmZzfM79L" {
  bucket = aws_s3_bucket.resourcely-test_mVARAaTQmZzfM79L.id

  versioning_configuration {
    status = "Disabled"
  }
}
