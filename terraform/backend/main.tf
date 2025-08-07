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

# # --- S3 Bucket ---
# resource "aws_s3_bucket" "tf_state" {
#   bucket = var.backend_bucket
# }

# resource "aws_s3_bucket_acl" "tf_state_acl" {
#   bucket = aws_s3_bucket.tf_state.id
#   acl    = "private"
# }

# resource "aws_s3_bucket_versioning" "tf_state_versioning" {
#   bucket = aws_s3_bucket.tf_state.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_sse" {
#   bucket = aws_s3_bucket.tf_state.id
#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }

# # --- DynamoDB Table ---
# resource "aws_dynamodb_table" "tf_locks" {
#   name         = var.dynamodb_table
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }