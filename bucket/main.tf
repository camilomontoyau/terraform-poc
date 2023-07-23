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

resource "aws_kms_key" "my_key" {
  description             = "This key is used to encrypt the backend bucket"
  deletion_window_in_days = 10
  is_enabled              = true
}
  
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.terraform_backend_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.my_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

output "kms_arn" {
  value = aws_kms_key.my_key.arn
}