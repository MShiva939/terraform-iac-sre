terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "terraform-state-sre1-project"   # Must exist before init
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}


