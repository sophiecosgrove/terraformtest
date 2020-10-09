provider "aws" {

  region                  = "eu-west-1"
  shared_credentials_file = "/home/ec2-user/.aws/credentials"
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

module "vpc" {
  source            = "./VPC"
  availability_zone = data.aws_availability_zones.available_zones.names[0]

}
module "internet_gateway" {
  source = "./IGW"
  vpc_id = module.vpc.vpc_id
}

module "security_groups" {
  source = "./SG"
  vpc_id = module.vpc.vpc_id
}

module "subnets" {
  source            = "./SUBNETS"
  vpc_id            = module.vpc.vpc_id
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  security_group_id = module.security_groups.security_group_id
  private_nated_rt_association_id = module.route_table.private_nated_rt_association_id
}

module "nat" {
  source           = "./NAT"
  public_subnet_id = module.subnets.public_subnet_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id

}

module "route_table" {
  source              = "./RT"
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  public_subnet_id    = module.subnets.public_subnet_id
  private_subnet_id   = module.subnets.private_subnet_id
  nat_gateway_id      = module.nat.nat_gateway_id
}

