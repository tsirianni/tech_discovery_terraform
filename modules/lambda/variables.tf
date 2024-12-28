variable "workspace" {
  description = "The workspace name"
  type        = string
}

variable "lambda_bucket" {
  type        = string
  default     = "tc-lambdas"
  description = "The bucket containing the code and .env files for the lambda functions"
}

# Hello World Lambda
variable "hello_world_lambda_role_arn" {
  type        = string
  description = "The Hello World Lambda role ARN"
}

variable "hello_world_lambda_qa_name" {
  type        = string
  default     = "qa-hello-world"
  description = "The name of the QA Hello World Lambda"
}

variable "hello_world_lambda_prod_name" {
  type        = string
  default     = "hello-world"
  description = "The name of the PROD Hello World Lambda"
}

variable "hello_world_lambda_qa_env_file_key" {
  type        = string
  default     = "qa-hello-world/.env"
  description = "The key to the QA Hello World Lambda .env"
}

variable "hello_world_lambda_prod_env_file_key" {
  type        = string
  default     = "hello-world/.env"
  description = "The key to the PROD Hello World Lambda .env"
}