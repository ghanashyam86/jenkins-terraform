variable "vpc_name" {
  type = string
  default = "jenkins-terraform-vpc"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.10.0.0/16"
}

variable "vpc_azs" {
   type = list(string)
   default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public_subnets" {
    type = list(string)
    default = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
}

