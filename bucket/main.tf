provider "aws" {
  region = "us-east-1"
  skip_region_validation = true
}

resource "aws_s3_bucket" "terraform_backend" {
  bucket = var.bucket_name
  acl    = var.bucket_acl
  tags   = var.bucket_tags
}