variable "ingress_ports" {
   type = list(number)
   default = [22, 80]

  }

variable "egress_ports" {
    type = list(number)
    default = [0]

  }

 resource "aws_security_group" "vpc-demo-security-groups" {
     name = "dynamic-security-group"
     vpc_id = aws_vpc.main.id

   dynamic "ingress" {
     for_each = var.ingress_ports
     iterator = ports
        content {
             from_port = ports.value
             to_port = ports.value
             protocol = "tcp"
             cidr_blocks = ["0.0.0.0/0"]
                }
   }

  dynamic "egress" {
     for_each = var.egress_ports
     iterator = ports
        content {
             from_port = ports.value
             to_port = ports.value
             protocol = "tcp"
             cidr_blocks = ["0.0.0.0/0"]
                }
   }

   tags = {
       Name = "${var.vpc_name}-security-group"
  }
}
