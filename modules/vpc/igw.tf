# ------- Internet Gateway ---------
resource "aws_internet_gateway" "accelerate_igw" {
  vpc_id = aws_vpc.accelerate_vpc.id
  tags = {
    Name : "${var.env}-ligtforth-igw"
  }
}
