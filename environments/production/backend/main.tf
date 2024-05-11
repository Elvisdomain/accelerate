terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.43.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = "default"
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