# Creating Public Subnet in VPC

resource "aws_subnet" "SWARM-VPC-Pub-subnet" {
  vpc_id                  = aws_vpc.SWARM-VPC.id
  cidr_block              = var.pub_subnet_cidr
  availability_zone = var.az_zone
  map_public_ip_on_launch = "true"
  depends_on = [aws_vpc.SWARM-VPC]
  tags = {
    Name = "SWARM-VPC-public-subnet"
  }
}
