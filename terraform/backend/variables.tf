variable "backend_bucket" {
  description = "Name of the S3 bucket to store Terraform state"
  type        = string
  default     = "terraform-state-sre1-project"
}

variable "backend_key" {
  description = "Path for the Terraform state file in S3"
  type        = string
  default     = "global/s3/terraform.tfstate"
}

variable "region" {
  description = "AWS region for backend resources"
  type        = string
  default     = "us-east-1"
}

variable "dynamodb_table" {
  description = "DynamoDB table name for Terraform state locking"
  type        = string
  default     = "terraform-locks"
}