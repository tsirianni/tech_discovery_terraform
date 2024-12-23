output "hello_world_lambda_role_arn" {
  value       = data.aws_iam_role.hello_world_lambda_role.arn
  sensitive   = false
  description = "The IAM role ARN for the QA and Prod Hello World Lambdas"
}