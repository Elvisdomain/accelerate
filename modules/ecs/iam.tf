# IAM Role for ECS Task Execution
resource "aws_iam_role" "accelerate_task_execution_role" {
  name               = "accelerate-task-execution-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      },
      Action    = "sts:AssumeRole"
    }]
  })
}

# IAM Policy for ECS Task Execution
resource "aws_iam_policy" "accelerate_task_execution_policy" {
  name        = "accelerate-task-execution-policy"
  description = "Policy for ECS Task Execution"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Action    = "ecr:GetAuthorizationToken",
      Resource  = "*"
    },
    {
      Effect    = "Allow",
      Action    = "ecr:BatchCheckLayerAvailability",
      Resource  = "*"
    },
    {
      Effect    = "Allow",
      Action    = "ecr:GetDownloadUrlForLayer",
      Resource  = "*"
    },
    {
      Effect    = "Allow",
      Action    = "ecr:BatchGetImage",
      Resource  = "*"
    }]
  })
}

# Attach IAM Policy to ECS Task Execution Role
resource "aws_iam_role_policy_attachment" "accelerate_task_execution_attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = aws_iam_policy.ecs_task_execution_policy.arn
}