locals {
  resource_count               = terraform.workspace == "default" ? 0 : 1
  hello_world_lambda_role_name = terraform.workspace == "qa" ? "qa-hello-world-role-9pbitllg" : "hello-world-role-ohf0ebkz"
}

# Lambda AIM Roles
resource "aws_iam_role" "hello_world_lambda_role" {
  count                 = local.resource_count
  name                  = local.hello_world_lambda_role_name
  description           = ""
  force_detach_policies = false
  max_session_duration  = 3600
  path                  = "/service-role/"
  permissions_boundary  = ""
  tags = {
    Iac     = true
    IacTool = "Terraform"
  }
  tags_all = {
    Iac     = true
    IacTool = "Terraform"
  }

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}
