resource "aws_vpc" "primaryvpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

}

resource "aws_subnet" "primarysubnet" {
    vpc_id = aws_vpc.primaryvpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-south-1a"

}

resource "aws_internet_gateway" "primaryigw" {
  vpc_id = aws_vpc.primaryvpc.id
}

resource "aws_route_table" "primary-route-table" {
  vpc_id = aws_vpc.primaryvpc.id

route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.primaryigw.id
  }

}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.primarysubnet.id
  route_table_id = aws_route_table.primary-route-table.id
}

                                              

resource "aws_security_group" "web_server_sg" {

  vpc_id = aws_vpc.primaryvpc.id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "vpcid" {
  value = aws_vpc.primaryvpc.id
}

output "subnetid" {
  value = aws_subnet.primarysubnet.id
}

output "sgid" {
  value = aws_security_group.web_server_sg.id
}
