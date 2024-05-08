variable "subnets-pub" {
  type = list(string)
}

variable "subnets-priv" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}

variable "env" {
  type = string
}
variable "cidr" {
  type = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = string
}