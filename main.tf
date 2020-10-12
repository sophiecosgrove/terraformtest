provider "aws" {

  region                  = "eu-west-1"
  shared_credentials_file = "/home/ec2-user/.aws/credentials"
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

# Private and public subnets and instances replicated accross all availability zones along with NAT gateways and route tables
module "deployment_multipleAZ" {
  source                  = "./deployment"
  count                   = length(data.aws_availability_zones.available_zones.names)
  availability_zone       = data.aws_availability_zones.available_zones.names[count.index]
  vpc_id                  = aws_vpc.vpc.id
  security_group_id       = module.networking.security_group_id
  security_group_id_priv  = module.networking.security_group_id_priv
  internet_gateway_id     = module.networking.internet_gateway_id
  internet_gateway        = module.networking.internet_gateway
  subnet_cidr_blocks_pub  = var.cidr_block_pub[count.index]
  subnet_cidr_blocks_priv = var.cidr_block_priv[count.index]
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}

# security group and internet gateway for all subnets and instances
module "networking" {
  source         = "./networking"
  vpc_id         = aws_vpc.vpc.id
  cidr_block_pub = var.cidr_block_pub
}


module "elastic_load_balancer" {
  source             = "./ELB"
  availability_zones = data.aws_availability_zones.available_zones.names
  security_group_id  = module.networking.security_group_id

}

