provider "aws" {

  region                  = "eu-west-1"
  shared_credentials_file = "/home/ec2-user/.aws/credentials"
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

data "aws_subnet_ids" "subnet_ids" {
  vpc_id = aws_vpc.vpc.id
}

module "deployment_multipleAZ" {
  source = "./deployment"
  count = length(data.aws_availability_zones.available_zones.names)
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]
  vpc_id = aws_vpc.vpc.id
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_elb" "elastic_load_balancer" {
  name               = "elb"
  subnets = data.aws_subnet_ids.subnet_ids.*.id

  access_logs {
    bucket        = "foo"
    bucket_prefix = "bar"
    interval      = 60
  }

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 8000
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "foobar-terraform-elb"
  }
}


