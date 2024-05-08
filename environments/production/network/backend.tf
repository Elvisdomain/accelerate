terraform {
  backend "s3" {
    bucket         = "irecharge-infra-state-bucket"
    key            = "prod/new-network/terraform.tfstate"
    region         = "us-east-1"
    profile        = "irecharge_infra"
    encrypt        = "true"
    dynamodb_table = "prod-terraform-state-lock-table"
  }
}