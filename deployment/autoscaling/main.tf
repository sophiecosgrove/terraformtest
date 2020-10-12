data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_launch_configuration" "pub_instance" {
  name                        = "pub_servers"
  image_id                    = data.aws_ami.amazon.id
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  security_groups             = [var.security_group_pub]
  associate_public_ip_address = var.associate_public_ip_address

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install docker -y
              sudo service docker start
              sudo docker run -p 5000:5000 -d name frontendflask sophiec0s/frontend:latest
              EOF
}

resource "aws_launch_configuration" "priv_instance" {
  name            = "priv_servers"
  image_id        = data.aws_ami.amazon.id
  instance_type   = "t2.micro"
  key_name        = var.key_name
  security_groups = [var.security_group_priv]
  

}

resource "aws_autoscaling_group" "autoscaling_public" {
  name                 = "autoscaling_pub"
  launch_configuration = aws_launch_configuration.pub_instance.name
  min_size             = 1
  max_size             = 2
  load_balancers       = var.load_balancers
  vpc_zone_identifier  = var.public_subnet_ids

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "autoscaling_private" {
  name                 = "autoscaling_priv"
  launch_configuration = aws_launch_configuration.priv_instance.name
  min_size             = 1
  max_size             = 2
  load_balancers       = var.load_balancers
  vpc_zone_identifier  = var.private_subnet_ids

  lifecycle {
    create_before_destroy = true
  }
}