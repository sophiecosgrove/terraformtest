provider "aws" {

  region                  = "eu-west-1"
  shared_credentials_file = "/home/ec2-user/.aws/credentials"
}

data "aws_instances" "elb-instance-ids" {
  filter {
      name = "tag:Name"
      values = ["instance1"]
    }
}

data "aws_security_groups" "elb-security-group-id"{
  filter {
    name = "group-name"
    values = ["allow_web_traffic"]

  }
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

resource "aws_elb" "elastic_load_balancer" {
  name            = "elb"
  availability_zones = data.aws_availability_zones.available_zones.names
  security_groups = [data.aws_security_groups.elb-security-group-id.id]

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 443
    lb_protocol       = "https"
  }

  listener {
    instance_port     = 8000
    instance_protocol = "tcp"
    lb_port           = 5000
    lb_protocol       = "tcp"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  instances = data.aws_instances.elb-instance-ids.*.id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "terraform-elb"
  }
}
