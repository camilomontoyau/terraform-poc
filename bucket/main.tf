provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_backend_bucket" {
  bucket = var.bucket_name
  tags   = var.bucket_tags
}

resource "aws_s3_bucket_acl" "terraform_backend_acl" {
  bucket = aws_s3_bucket.terraform_backend_bucket.id
  acl    = "private"
}