terraform {
  backend "s3" {
    bucket         = "terraform-state-sre1-project"
    key            = "ecr/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"   # Optional, for state locking
    encrypt        = true
  }
}