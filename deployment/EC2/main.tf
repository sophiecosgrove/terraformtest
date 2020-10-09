resource "aws_instance" "instance1" {
  ami                         = var.ami
  instance_type               = var.type
  key_name                    = var.key_name
  availability_zone           = var.availability_zone
  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids = [ var.security_group_id ]

  tags = {
    Name = "instance1"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              EOF

}

resource "aws_instance" "instance2" {
  ami                         = var.ami
  instance_type               = var.type
  key_name                    = var.key_name
  availability_zone           = var.availability_zone
  subnet_id                   = var.private_subnet_id
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Name = "instance2"
  }
}
