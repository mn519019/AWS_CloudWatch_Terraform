terraform {
  backend "s3" {
    bucket         = "test-iac-tfstates"
    key            = "terraform/test-iac/non-prod/non-prod-iac-monitoring.tfstate"
    region         = "ca-central-1"
    dynamodb_table = "test-iac-global-terraform-lock"
    encrypt        = true
  }
}