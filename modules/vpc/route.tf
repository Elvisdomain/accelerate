# ------- Route Table Public---------
resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name : "${var.env}-lightforth-public-route-table"
  }
}

# ------- Route  Public---------
resource "aws_route" "r_public" {
  route_table_id         = aws_route_table.rt_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

# ------- Route Table Private ---------
resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name : "${var.env}-lightforth-private-route-table"
  }
}

# ------- Route  Private ---------
resource "aws_route" "r_private" {
  route_table_id         = aws_route_table.rt_private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}

# ------- Route  Table Association Public ---------
resource "aws_route_table_association" "rtb_ass_public" {
  count          = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.rt_public.id
}

# ------- Route Table Association Private ---------
resource "aws_route_table_association" "rtb_ass_private" {
  count          = 2
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.rt_private.id
}
