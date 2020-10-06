resource "aws_instance" "instance1" {
  ami                         = var.ami
  instance_type               = var.type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Name = "instance1"
  }

}

resource "aws_instance" "instance2" {
  ami                         = var.ami
  instance_type               = var.type
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Name = "instance2"
  }
}
