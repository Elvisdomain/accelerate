# ------- Route Table Public---------
resource "aws_route_table" "accelerate_rt_public" {
  vpc_id = aws_vpc.accelerate_vpc.id
  tags = {
    Name : "public-route-table"
  }
}

# ------- Route  Public---------
resource "aws_route" "accelerate_r_public" {
  route_table_id         = aws_route_table.accelerate_rt_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.accelerate_igw.id
}

# ------- Route Table Private ---------
resource "aws_route_table" "accelerate_rt_private" {
  vpc_id = aws_vpc.accelerate_vpc.id
  tags = {
    Name : "lightforth-private-route-table"
  }
}
/*
# ------- Route  Private ---------
resource "aws_route" "accelerate_r_private" {
  route_table_id         = aws_route_table.accelerate_rt_private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.accelerate_igw.id
}*/

# ------- Route  Table Association Public ---------
resource "aws_route_table_association" "accelerate_rtb_ass_public" {
  count          = 2
  subnet_id      = aws_subnet.accelerate-public[count.index].id
  route_table_id = aws_route_table.accelerate_rt_public.id
}

# ------- Route Table Association Private ---------
resource "aws_route_table_association" "accelerate_rtb_ass_private" {
  count          = 2
  subnet_id      = aws_subnet.accelerate-private[count.index].id
  route_table_id = aws_route_table.accelerate_rt_private.id
}
