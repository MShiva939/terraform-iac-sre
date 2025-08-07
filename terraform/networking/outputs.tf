output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "public_subnets" {
  value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

output "private_subnets" {
  value = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}

output "security_group_id" {
  value = aws_security_group.app_sg.id
}