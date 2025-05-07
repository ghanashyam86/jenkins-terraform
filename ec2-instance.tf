resource "aws_instance" "public_instance" {
  count = 3
  ami = data.aws_ami.amzn_linux2.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet[count.index].id
  vpc_security_group_ids = [aws_security_group.vpc-demo-security-groups.id]
  key_name = "n.verginia633"
  availability_zone = data.aws_availability_zones.available[count.index]
  
  tags = {
    Name = "${var.vpc_name}-server-${count.index + 1}"
  }
}
  
