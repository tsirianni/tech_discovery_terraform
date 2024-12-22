locals {
  resource_count = var.workspace == "default" ? 0 : 1
}

# Lambda AIM Roles
resource "aws_iam_role" "hello_world_lambda_role" {
  count                 = local.resource_count
  name                  = var.workspace == "qa" ? var.hello_world_lambda_iam_role_qa_name : var.hello_world_lambda_iam_role_prod_name
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

  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}
