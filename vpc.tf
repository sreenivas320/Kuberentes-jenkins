# Creating VPC,Subnets,routetables Gateway, Natgatway and subnet association Etc.....
resource "aws_vpc" "SWARM-VPC" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
   tags = {
    Name = "SWARM-VPC"
  }
}
