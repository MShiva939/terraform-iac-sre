variable "project_name" { default = "devops-project" }
variable "region" { default = "us-east-1" }
variable "vpc_id" { default = "vpc-076f8464252b100b7" }
variable "public_subnets" {
  type = list(string)
  default = [ "subnet-08b77719fa8d4a690", "subnet-0d24ee1867444ac18" ]
}
variable "private_subnets" {
  type = list(string)
  default = [ "subnet-0876078ffd92b5a06", "subnet-09b10037ed2b6685e" ]
}
variable "security_group_id" {
    description = "Security group ID for EC2 Instance"
    type = string
    default = "sg-0cdbb85b8063552e7"
}
variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default     = "ami-02b3c03c6fadb6e2c" # Amazon Linux 2
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_pair_name" {
  description = "Existing EC2 Key pair name"
  type = string
  default = "terraform-keypair"
}