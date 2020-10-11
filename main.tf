provider "aws" {

  region                  = "eu-west-1"
  shared_credentials_file = "/home/ec2-user/.aws/credentials"
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

data "aws_subnet_ids" "subnet_ids" {
  vpc_id = aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["public_subnet"]
  }
}

# Private and public subnets and instances replicated accross all availability zones along with NAT Gateways and Route Tables
module "deployment_multipleAZ" {
  source              = "./deployment"
  count               = length(data.aws_availability_zones.available_zones.names)
  availability_zone   = data.aws_availability_zones.available_zones.names[count.index]
  vpc_id              = aws_vpc.vpc.id
  security_group_id   = module.networking.security_group_id
  internet_gateway_id = module.networking.internet_gateway_id
  internet_gateway    = module.networking.internet_gateway
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}

# Security Group and Internet Gateway for all subnets and instances
module "networking" {
  source = "./networking"
  vpc_id = aws_vpc.vpc.id
}

module "elastic_load_balancer" {
  source            = "./ELB"
  subnets           = data.aws_subnet_ids.subnet_ids.*.id
  security_group_id = module.networking.security_group_id

}

