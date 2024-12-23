data "aws_iam_policy_document" "lambda_assume_role_policy" {
  version = "2012-10-17"

  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_role" "hello_world_lambda_role" {
  name = aws_iam_role.hello_world_lambda_role[0].name
}