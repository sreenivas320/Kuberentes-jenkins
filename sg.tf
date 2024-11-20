#Create a security group-public

resource "aws_security_group" "SWARM-VPC-SG" {

name = "SWARM-VPC-SG"

description = "Allow Web inbound traffic"

vpc_id = aws_vpc.SWARM-VPC.id



ingress {

protocol = "tcp"

from_port = 80

to_port = 80

cidr_blocks = ["0.0.0.0/0"]

}



ingress {

protocol = "tcp"

from_port = 22

to_port = 22

cidr_blocks = ["0.0.0.0/0"]

}

ingress {

protocol = "tcp"

from_port = 443

to_port = 443

cidr_blocks = ["0.0.0.0/0"]

}

ingress {
  #protocol = "allports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks =  ["0.0.0.0/0"]
  }

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
