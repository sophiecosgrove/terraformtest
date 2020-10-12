resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.vpc_id
  availability_zone       = var.availability_zone
  cidr_block              = var.subnet_cidr_blocks_pub
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  cidr_block        = var.subnet_cidr_blocks_priv

  tags = {
    Name = "private_subnet"
  }
}

# NAT gateway in public subnet
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = aws_subnet.public_subnet.id
  depends_on    = [var.internet_gateway]
}

resource "aws_eip" "nat_gw_eip" {
  vpc        = true
  depends_on = [var.internet_gateway]
}

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
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.vpc_rt.id
}

# route table allowing private subnet to connect to the internet
resource "aws_route_table" "private_nated" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "Main Route Table for NAT-ed subnet"
  }
}

resource "aws_route_table_association" "private_nated_rt_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_nated.id
}