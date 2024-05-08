resource "aws_ecr_repository" "backend_users" {
  count = length(var.ecr)
  name  = "${var.env}-${var.ecr[count.index]}"
  image_scanning_configuration {
    scan_on_push = false
  }
}
