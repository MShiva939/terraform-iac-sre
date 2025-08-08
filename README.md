# Terraform Infrastructure Documentation

Overview:
This Terraform configuration provisions the complete AWS infrastructure required for the Automated Web Application Deployment project.
It ensures a secure, scalable, and production-ready environment, following SRE principles like idempotency, automation, and observability.

Infrastructure Components:

VPC:
A custom VPC is provisioned with public and private subnets across multiple Availability Zones to ensure high availability.

Subnets:
Public subnets are created for the Application Load Balancer (ALB) and NAT Gateway.
Private subnets are created for EC2 application instances.

Security Groups:
An ALB Security Group allows inbound HTTP/HTTPS traffic.
An EC2 Security Group allows inbound traffic only from the ALB Security Group.
Restrictive outbound rules are configured for enhanced security.

Application Load Balancer (ALB):
An internet-facing ALB distributes traffic to EC2 instances.
Health checks are enabled for continuous monitoring.

EC2 Instances (for CodeDeploy):
Amazon Linux 2 instances are provisioned with the CodeDeploy agent pre-installed.
An IAM Role is attached to provide access to S3, ECR, and CloudWatch.

IAM Roles:
An EC2 Role is configured for the instance profile.
A CodePipeline Role is configured for pipeline actions.
A CodeBuild Role is configured for the build environment.
A CodeDeploy Role is configured for deployments.

Remote Backend:
An S3 bucket is used for Terraform state storage.
A DynamoDB table is used for state locking to prevent concurrent modifications.


# Prerequisites

Terraform CLI (version >= 1.0.0) must be installed on your local machine.
AWS CLI must be installed and configured with valid credentials.
An IAM user with AdministratorAccess is required for the initial setup.
An S3 bucket and a DynamoDB table must be created in advance for the Terraform remote backend.

# Installations 
Terraform 	
https://releases.hashicorp.com/terraform/1.12.2/terraform_1.12.2_windows_386.zip
Add terraform path to the sysytem environment variables

Git 	
https://git-scm.com/downloads/win

AWS CLI 	
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
	
# Setup & Deployment
Step 1: Initialize Terraform
$ terraform init

Step 2: Validate the Configuration
$ terraform validate

Step 3: Create and Review the Execution Plan
$ terraform plan 

Step 4: Apply the Infrastructure Changes
$ terraform apply 

# Security Best Practices
1. Use least privilege IAM policies for all roles and users.
2. Store Terraform state remotely and ensure encryption is enabled.
3. Rotate AWS access keys regularly.
4. Enable CloudWatch monitoring for all AWS resources.

