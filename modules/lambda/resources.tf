# locals {
#   function_name = terraform.workspace == "qa" ? "qa-hello-world" : "hello-world"
#   role_name     = terraform.workspace == "qa" ? "qa-hello-world-role-9pbitllg" : "hello-world-role-ohf0ebkz"
# }

# resource "aws_lambda_function" "hello_world" {
#   runtime = "nodejs18.x"
#   function_name = "${local.function_name}"
#   handler       = "index.handler"
# }