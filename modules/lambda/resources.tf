locals {
  resource_count = var.workspace == "default" ? 0 : 1

  # Hello World Lambda
  hello_world_function_name         = var.workspace == "qa" ? var.hello_world_lambda_qa_name : var.hello_world_lambda_prod_name
  hello_world_function_env_file_key = var.workspace == "qa" ? var.hello_world_lambda_qa_env_file_key : var.hello_world_lambda_prod_env_file_key
  hello_world_env_file_content      = data.aws_s3_object.hello_world_env_file.body

  env_vars = tomap({
    for variable in [
      for line in split("\n", local.hello_world_env_file_content) :
      trimspace(line)
      if length(trimspace(line)) > 0 && !can(regex("^#", line))
    ] :

    # Apply the regex to extract key and value from the line
    trimspace(regex("^(.*)=(.*)$", variable)[0]) => trimspace(regex("^(.*)=(.*)$", variable)[1])
  })
}

resource "aws_s3_object" "hello_world_env_file" {
  bucket = var.lambda_bucket
  key    = local.hello_world_function_env_file_key
}

resource "aws_lambda_function" "hello_world" {
  count                              = local.resource_count
  function_name                      = local.hello_world_function_name
  role                               = var.hello_world_lambda_role_arn
  architectures                      = ["x86_64"]
  code_signing_config_arn            = ""
  description                        = "A starter AWS Lambda function."
  filename                           = null
  handler                            = "index.handler"
  kms_key_arn                        = ""
  layers                             = []
  memory_size                        = 128
  package_type                       = "Zip"
  publish                            = null
  reserved_concurrent_executions     = -1
  replace_security_groups_on_destroy = null
  replacement_security_group_ids     = null
  runtime                            = "nodejs18.x"
  s3_bucket                          = var.lambda_bucket
  s3_key                             = "qa-hello-world/qa-hello-world.zip"
  s3_object_version                  = null
  skip_destroy                       = false
  timeout                            = 60
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
  ephemeral_storage {
    size = 512
  }
  logging_config {
    application_log_level = "INFO"
    log_format            = "JSON"
    log_group             = "/aws/lambda/qa-hello-world"
    system_log_level      = "INFO"
  }
  tracing_config { mode = "PassThrough" }
  environment {
    variables = local.env_vars
  }
}