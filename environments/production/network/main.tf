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
  profile = "irecharge-infra"
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
