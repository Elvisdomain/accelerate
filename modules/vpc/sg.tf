resource "aws_security_group" "alb-sg" {
  name       = "ALB-SG"
  vpc_id     = aws_vpc.accelerate_vpc.id
  depends_on = [aws_vpc.accelerate_vpc]

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3000
    protocol    = "tcp"
    to_port     = 3000
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  tags = {
    Name : "irecharge-alb-sg"
  }
}
# ------- Security Group ---------
resource "aws_security_group" "accelerate_SG" {
  name       = "accelerate_SG"
  vpc_id     = aws_vpc.accelerate_vpc.id
  depends_on = [aws_vpc.accelerate_vpc]

  ingress {
    cidr_blocks     = ["0.0.0.0/0"]
    from_port       = 0
    protocol        = "tcp"
    to_port         = 65535
    security_groups = [aws_security_group.alb-sg.id]
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 444
    protocol    = "tcp"
    to_port     = 444
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  tags = {
    Name : "accelerate_SG"
  }
}