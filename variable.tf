variable "vpc_name" {
  type = string
  default = "jenkins-terraform-vpc"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.10.0.0/16"
