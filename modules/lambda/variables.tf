variable "workspace" {
  description = "The workspace name"
  type        = string
}

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