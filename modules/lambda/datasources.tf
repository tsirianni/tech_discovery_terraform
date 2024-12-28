data "aws_s3_object" "hello_world_env_file" {
  bucket = var.lambda_bucket
  key    = var.workspace == "qa" ? var.hello_world_lambda_qa_env_file_key : var.hello_world_lambda_prod_env_file_key
}