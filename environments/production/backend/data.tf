data "aws_secretsmanager_secret_version" "credentials" {
  secret_id = "prod/irecharge/terraform"
}

# Use locals to grab the decrypted key from secret manager
locals {
  credentials = jsondecode(
    data.aws_secretsmanager_secret_version.credentials.secret_string
  )

}

data "aws_vpc" "accelerate_vpc" {
  id = var.vpc_id
}

# Fetching a single public subnet
data "aws_subnets" "public" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_name]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }
}

# Fetching multiple private subnets
data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_name]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }
}


data "aws_security_group" "alb" {
  name   = var.security_group_name
  vpc_id = data.aws_vpc.this.id
}

# output "vpc" {
#   value = data.aws_vpc.this
# }
# output "public_subnet_id" {
#   value = data.aws_subnets.public
# }

output "private_subnet_id" {
  value = data.aws_subnets.private.ids
}

# output "security_groups" {
#   value = data.aws_security_group.alb
# }