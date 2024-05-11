terraform {
  required_version = ">=1.8.3"

  backend "s3" {
    bucket         = "irecharge-infra-state-bucket"
    key            = "prod/new-network/terraform.tfstate"
    profile        = "irecharge-infra"
    encrypt        = "true"
    dynamodb_table = "prod-terraform-state-lock-table"
  }
}
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source       = "../../../modules/vpc"
  env          = "dev"
  azs          = jsondecode(local.credentials.azs)
  subnets-priv = jsondecode(local.credentials.subnets-priv)
  subnets-pub  = jsondecode(local.credentials.subnets-pub)
  alb-sg          = data.aws_security_group.alb-sg.id
  security_group_ids  = local.credentials.sg
}
