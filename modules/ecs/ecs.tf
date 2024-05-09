# ECS Cluster
resource "aws_ecs_cluster" "accelerate-cluster" {
  name = var.accelerate-cluster
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
      cpu       = 4
      memory    = 16
      portMappings = [{
        containerPort = 80
        hostPort      = 0
      }]
    }
  ])
}



# Create ECS Service
resource "aws_ecs_service" "wallet-service" {
  name            = "wallet-service"
  cluster         = aws_ecs_cluster.accelerate-cluster.id
  task_definition = aws_ecs_task_definition.wallet-task-def.arn
  desired_count   = 1
}

 
 # Attach ALB Target Group to ECS Service
resource "aws_ecs_service" "wallet-service" {
  name            = "wallet-service"
  cluster         = aws_ecs_cluster.accelerate-cluster.id
  task_definition = aws_ecs_task_definition.wallet-task-def.arn
  desired_count   = 2
  launch_type     = "EC2"
  network_configuration {
    subnets          = ["accelerate-public1", "accelerate-public2"]
    security_groups  = [alb_sg.id]
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.my_target_group.arn
    container_name   = "my-container"
    container_port   = 80
  }
}