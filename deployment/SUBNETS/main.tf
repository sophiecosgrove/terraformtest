resource "aws_subnet" "public_subnet" {
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  cidr_block        = var.subnet_cidr_blocks[0]

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  cidr_block        = var.subnet_cidr_blocks[1]

  tags = {
    Name = "private_subnet"
  }
}