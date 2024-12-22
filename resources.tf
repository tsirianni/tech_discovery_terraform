locals {
  /*
    This resources should only be managed/created in the default workspace, for that we have to control the count
    by verifying the current workspace. By doing that, when running `terraform play/apply` in qa or prod, it will
    NOT try to create these resources again and associate them with other workspace's states.
   */
  resource_count = terraform.workspace == "default" ? 1 : 0
}

resource "aws_s3_bucket" "terraform_state_bucket" {
  count = local.resource_count

  bucket = var.state_bucket_name

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Iac     = true
    IacTool = "Terraform"
  }

  tags_all = {
    Iac     = true
    IacTool = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_bucket_versioning" {
  count = local.resource_count

  bucket = aws_s3_bucket.terraform_state_bucket[count.index].bucket # Correctly reference the bucket with count.index

  depends_on = [aws_s3_bucket.terraform_state_bucket]

  versioning_configuration {
    status = "Enabled"
  }
}

module "lambda" {
  source = "./modules/lambda"
}

module "iam" {
  source = "./modules/iam"
  workspace = terraform.workspace
}
