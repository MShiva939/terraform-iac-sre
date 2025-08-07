output "ec2_role_arn" {
  value = aws_iam_role.ec2_role.arn
}

output "codebuild_role_arn" {
  value = aws_iam_role.codebuild_role.arn
}

output "codepipeline_role_arn" {
  value = aws_iam_role.codepipeline_role.arn
}

output "codedeploy_role_arn" {
  value = aws_iam_role.codedeploy_role.arn
}