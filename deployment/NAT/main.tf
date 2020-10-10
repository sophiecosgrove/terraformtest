resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = var.public_subnet_id
<<<<<<< HEAD
=======
  depends_on = [var.internet_gateway_id]
>>>>>>> d7c0fc58b50f19706ce06e1d63377b978282d7b9
}

resource "aws_eip" "nat_gw_eip" {
  vpc = true
}