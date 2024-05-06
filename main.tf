terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_s3_bucket" "resourcely-test_RUfxwvYmtDixPwyb" {
  bucket = "test"
}

resource "aws_s3_bucket_public_access_block" "resourcely-test_RUfxwvYmtDixPwyb" {
  bucket                  = aws_s3_bucket.resourcely-test_RUfxwvYmtDixPwyb.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "resourcely-test_RUfxwvYmtDixPwyb" {
  bucket = aws_s3_bucket.resourcely-test_RUfxwvYmtDixPwyb.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_versioning" "resourcely-test_RUfxwvYmtDixPwyb" {
  bucket = aws_s3_bucket.resourcely-test_RUfxwvYmtDixPwyb.id

  versioning_configuration {
    status = "Enabled"
  }
}
