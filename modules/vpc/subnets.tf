# ------- Public Subnets ---------
resource "aws_subnet" "accelerate-public" {
  count                   = length(var.azs)
  vpc_id                  = aws_vpc.accelerate_vpc.id
  availability_zone       = var.azs[count.index]
  cidr_block              = var.subnets-pub[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name : "accelerate-public"
  }
}



# ------- Private Subnets ---------
resource "aws_subnet" "accelerate-private" {
  vpc_id            = aws_vpc.accelerate_vpc.id
  count             = length(var.azs)
  availability_zone = var.azs[count.index]
  cidr_block        = var.subnets-priv[count.index]
  tags = {
    Name : "accelerate-public"
  }
}
