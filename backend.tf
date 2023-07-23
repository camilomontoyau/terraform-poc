terraform {
    backend "s3" {
        bucket = "my-terraform-backend-2"
        key    = "poc"
        region = "us-east-1"
        kms_key_id = "arn:aws:kms:us-east-1:479692600991:key/c6261fde-1647-47ef-ab86-ee81d2108dee"
        encrypt = true
    }
}