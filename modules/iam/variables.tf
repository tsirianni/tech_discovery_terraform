variable "workspace" {
  description = "The workspace name"
  type        = string
}

variable "hello_world_lambda_iam_role_qa_name" {
  type        = string
  default     = "qa-hello-world-role-9pbitllg"
  description = "The name of the Hello World Lambda IAM Role in QA workspace"
}

variable "hello_world_lambda_iam_role_prod_name" {
  type        = string
  default     = "hello-world-role-ohf0ebkz"
  description = "The name of the Hello World Lambda IAM Role in PROD workspace"
}
