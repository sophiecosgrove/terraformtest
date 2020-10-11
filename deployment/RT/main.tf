# route table directing traffic to internet gateway
resource "aws_route_table" "vpc_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "Route Table for VPC"
  }
}

resource "aws_route_table_association" "rt_public_subnet" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.vpc_rt.id
}

# route table allowing private subnet to connect to the internet
resource "aws_route_table" "private_nated" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "Main Route Table for NAT-ed subnet"
  }
}

resource "aws_route_table_association" "private_nated_rt_association" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private_nated.id
}