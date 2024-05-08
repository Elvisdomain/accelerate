# Backend_User_Service
resource "aws_lb" "wallet-lb" {
  name               = "wallet-lb"
  subnets            = var.subnets-pub
  security_groups    = [var.alb_sg]
  internal           = false
  load_balancer_type = "application"
  enable_http2       = true
  idle_timeout       = 30
  tags = {
    Name : "${var.env}_${var.project_name}"
  }
}

resource "aws_lb_target_group" "wallet-TG" {
  name        = "${var.project_name}-wallet"
  port        = var.wallet-TG_port
  target_type = "instance"
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  depends_on  = [aws_lb.this]
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = "10"
    timeout             = "5"
    unhealthy_threshold = "3"
    healthy_threshold   = "3"
  }
}

resource "aws_lb_listener" "wallet-listener" {
  load_balancer_arn = aws_lb.wallet-lb.arn
  port              = "8080"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wallet-TG.arn
  }
  depends_on = [aws_lb_target_group.wallet-TG]
}

# listener for the https load balancer
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.wallet-lb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = var.certificate_arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wallet-TG.arn

  }
  depends_on = [aws_lb_target_group.wallet-TG]
}