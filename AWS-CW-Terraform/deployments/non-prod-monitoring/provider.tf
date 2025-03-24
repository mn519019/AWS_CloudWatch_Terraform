terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.43.0"
    }
  }
  required_version = "~> 1.7"
}

provider "aws" {
  region = "ca-central-1"

  assume_role {
    role_arn    = "arn:aws:iam::account_number:role/iac-cross-account-role"
    external_id = "test_account"
  }
}