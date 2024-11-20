# Creating Route Tables for Internet gateway
resource "aws_route_table" "pub_routing_table" {
  vpc_id = aws_vpc.SWARM-VPC.id

  route {
#    cidr_block = "0.0.0.0/0"
    cidr_block =  var.route
    gateway_id = aws_internet_gateway.SWARM-VPC-IGW.id
  }

  tags = {
    Name = "SWARM-VPC-Public-table"
  }
}


# Creating Route Associations public subnets
resource "aws_route_table_association" "SWARM-VPC-rt-internet" {
  subnet_id      = aws_subnet.SWARM-VPC-Pub-subnet.id
  route_table_id = aws_route_table.pub_routing_table.id
  
  }
