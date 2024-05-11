variable "subnets-pub" {
  type = list(string)
  default = [ "subnets-pub" ]
}

variable "subnets-priv" {
  type = list(string)
  default = [ "asubnets-pub" ]
}
variable "azs" {
  type = list(string)
  default = [ "azs" ]
}

variable "alb-sg" {
  type = list(string)
  default = [ "alb-sg" ]
}

variable "env" {
  type = string
  default = "env"
}
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"  
}
variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default = [ "security_group_ids" ]
}

