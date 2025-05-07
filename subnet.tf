resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.public_subnets, count.index)
  availability_zone = element(var.vpc_azs, count.index)

  tags={
    Name= "public-subnet-${count.index + 1}"
  }
}

