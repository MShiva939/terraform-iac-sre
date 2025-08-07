provider "aws" {
    region = var.aws_region
}
resource "aws_ecr_repository" "app_repo" {
  name                 = var.ecr_repo_name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.image_scan_on_push
  }

  tags = {
    Name        = var.ecr_repo_name
    Environment = "dev"
    Project     = "terraform-iac-sre"
  }
}

# ECR Lifecycle policy (optional: keep last 10 images)
resource "aws_ecr_lifecycle_policy" "policy" {
  repository = aws_ecr_repository.app_repo.name

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 10 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}