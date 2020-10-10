resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.vpc_id
  availability_zone       = var.availability_zone
  cidr_block              = var.subnet_cidr_blocks[0]
  map_public_ip_on_launch = true

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

resource "aws_instance" "instance1" {
  ami                         = var.ami
  instance_type               = var.type
  key_name                    = var.key_name
  availability_zone           = var.availability_zone
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [var.security_group_id]

  tags = {
    Name = "instance1"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              EOF

}

resource "aws_instance" "instance2" {
  ami               = var.ami
  instance_type     = var.type
  key_name          = var.key_name
  availability_zone = var.availability_zone
  subnet_id         = aws_subnet.private_subnet.id
  vpc_security_group_ids      = [var.security_group_id]

  tags = {
    Name = "instance2"
  }
}