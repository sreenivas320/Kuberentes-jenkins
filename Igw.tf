# It will create Internetgateway
resource "aws_internet_gateway" "SWARM-VPC-IGW" {
  vpc_id = aws_vpc.SWARM-VPC.id

  tags = {
    Name = "aws_vpc.SWARM-VPC.IGW"
 
  }
}
