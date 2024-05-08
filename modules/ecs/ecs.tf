# ECS Cluster
resource "aws_ecs_cluster" "accelerate-cluster" {
  name = var.ecs_cluster_name
  configuration {
    execute_command_configuration {
      logging    = "OVERRIDE"
    }
  }  
}


# Create ECS Task Definition
resource "aws_ecs_task_definition" "wallet-task-def" {
  family                   = var.task_definition_family
  container_definitions    = jsonencode([
    {
      name      = "my-container"
      image     = var.container_image
      cpu       = 256
      memory    = 512
      portMappings = [{
        containerPort = 80
        hostPort      = 0
      }]
    }
  ])
}



# Create ECS Service
resource "aws_ecs_service" "wallet service" {
  name            = "wallet service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = 1
}

 