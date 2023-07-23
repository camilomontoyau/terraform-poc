provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_backend_bucket" {
  bucket = var.bucket_name
  tags   = var.bucket_tags
}

resource "aws_s3_bucket_ownership_controls" "terraform_backend_bucket_ownership_controls" {
  bucket = aws_s3_bucket.terraform_backend_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.terraform_backend_bucket_ownership_controls]
  bucket = aws_s3_bucket.terraform_backend_bucket.id
  acl    = "private"
}