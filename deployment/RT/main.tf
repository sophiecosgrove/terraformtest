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

resource "aws_route_table" "private_subnet_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.private_subnet_cidr_block
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "Route Table for private subnet"
  }
}

resource "aws_route_table_association" "rt_private_subnet" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private_subnet_rt.id
}