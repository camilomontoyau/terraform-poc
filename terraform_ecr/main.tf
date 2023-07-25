provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "my_ecr_repo" {
  for_each = toset(var.ecr_repo_names)
  name = each.key
  image_tag_mutability = var.image_tag_mutability
  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
  encryption_configuration {
    encryption_type = var.encryption_type
  }
  tags = var.tags
}

output "ecr_repo_urls" {
  value = [for r in values(aws_ecr_repository.my_ecr_repo) : r.repository_url]
}