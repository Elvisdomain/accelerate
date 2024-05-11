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



module "wallet_alb" {
  project_name    = "wallet-lb"
  source          = "../../../modules/alb"
  env             = "dev"
  vpc_id          = data.aws_vpc.accelerate_vpc.id
  accelerate-public    = ["subnet-013a24e69c91171df", "subnet-0e1b88c520f568b51"]
  alb_sg          = data.aws_security_group.alb-sg.id
  wallet-TG_port  = "80"
  certificate_arn = local.credentials.wallet_certificate_arn
}