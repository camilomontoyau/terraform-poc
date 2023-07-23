terraform {
    backend "s3" {
        bucket = "my-terraform-backend-2"
        key    = "dev"
        region = "us-east-1"
    }
}