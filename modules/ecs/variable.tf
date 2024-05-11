variable "security_group_ids" {
  description = "List of security group IDs"
  default     = "security_group ids"
}

variable "accelerate-cluster" {
  description = "Name of the ECS cluster"
  default     = "accelerate-cluster"
}

variable "task_definition_family" {
  description = "Family name for the ECS task definition"
  default     = "wallet-task-def"
}

variable "container_image" {
  description = "URL of the container image"
  default     = "your_image_url"
}




variable "env" { type = string }
variable "ecs_cluster_name" { type = string }
variable "region" { type = string }
# variable "ecs_images" { type = list(string) }
/*variable "task_definitions" {
  description = "Configuration for ECS Task Definitions"
  type = list(object({
    family : string
    container_name : string
    image_url : string
    container_port : number
    host_port : number
    environment = list(object({
      name  = string
      value = string
    }))
  }))
}*/

/*
variable "wallet-service" {
  description = "Configuration for ECS Services"
  type = list(object({
    name : string
    load_balancer_target_group_arn : string
    container_name : string
    container_port : number
    subnets : list(string)
    security_groups : list(string)
    assign_public_ip : bool
    default     = list(string)
  }))
} */


variable "wallet-task-def" {
  description = "Name of wallet task def"
  default     = "wallet-task-def"
}

variable "wallet-service" {
  description = "Name of the ECS cluster"
  default     = "wallet-service"
}