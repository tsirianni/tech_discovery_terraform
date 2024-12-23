locals {
  resource_count            = var.workspace == "default" ? 0 : 1
  hello_world_function_name = var.workspace == "qa" ? var.hello_world_lambda_qa_name : var.hello_world_lambda_prod_name
}

resource "aws_lambda_function" "hello_world" {
  count                   = local.resource_count
  function_name           = local.hello_world_function_name
  role                    = var.hello_world_lambda_role_arn
  architectures           = ["x86_64"]
  code_signing_config_arn = ""
  description             = "A starter AWS Lambda function."
  ephemeral_storage {
    size = 512
  }
  filename    = null
  handler     = "index.handler"
  kms_key_arn = ""
  layers      = []
  logging_config {
    application_log_level = "INFO"
    log_format            = "JSON"
    log_group             = "/aws/lambda/qa-hello-world"
    system_log_level      = "INFO"
  }
  memory_size                        = 128
  package_type                       = "Zip"
  publish                            = null
  reserved_concurrent_executions     = -1
  replace_security_groups_on_destroy = null
  replacement_security_group_ids     = null
  runtime                            = "nodejs18.x"
  s3_bucket                          = "tc-lambdas"
  s3_key                             = "qa-hello-world/qa-hello-world.zip"
  s3_object_version                  = null
  skip_destroy                       = false
  timeout                            = 60
  tracing_config { mode = "PassThrough" }
  tags = {
    Iac                        = true
    IacTool                    = "Terraform"
    "lambda-console:blueprint" = "hello-world"
  }
  tags_all = {
    Iac                        = true
    IacTool                    = "Terraform"
    "lambda-console:blueprint" = "hello-world"
  }

}