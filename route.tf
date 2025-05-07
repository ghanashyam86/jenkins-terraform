
# public-route table

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
     Name = "${var.vpc_name}-route-table"
  }
}

# route table association

resource "aws_route_table_association" "public-rt-asso" {
   count = length(aws_subnet.public_subnet)
   subnet_id      = element(aws_subnet.public_subnet[*].id, count.index)
   route_table_id = aws_route_table.public_rt.id
}
