provider "aws" {

  region                  = "eu-west-1"
  shared_credentials_file = "/home/ec2-user/.aws/credentials"
}

module "webserver_node" {
  source = "./EC2"

}

module "aws_vpc" {
  source = "./VPC"
}

