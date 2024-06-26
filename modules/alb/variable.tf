variable "project_name" {
  type = string
}
variable "env" {
  type = string
}

variable "accelerate-public" {
  type = list(string)
}

variable "alb_sg" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "wallet-TG_port" {
  type = number
}

variable "certificate_arn" {
  type = string
}
