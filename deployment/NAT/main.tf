resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = var.private_subnet_id
}

resource "aws_eip" "nat_gw_eip" {
  vpc = true
}