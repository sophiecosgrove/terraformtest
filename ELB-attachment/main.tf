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
