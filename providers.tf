terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }

  backend "s3" {
    bucket  = "tobias-iac-state-bucket" # Needs to be hardcoded here, cannot use variables in this scope
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true
    profile = "tobias"
  }

}

provider "aws" {
  region  = "us-east-1"
  profile = "tobias"
}