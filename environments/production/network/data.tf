data "aws_secretsmanager_secret_version" "credentials" {
  secret_id = "prod/irecharge/terraform"
}

# Use locals to grab the decrypted key from secret manager
locals {
  credentials = jsondecode(
    data.aws_secretsmanager_secret_version.credentials.secret_string
  )

}

data "aws_security_group" "alb-sg" {
  name   = var.security_group_name
  vpc_id = data.aws_vpc.accelerate_vpc.id
}

data "aws_vpc" "accelerate_vpc" {
  id = var.vpc_id
}

