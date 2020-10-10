provider "aws" {

  region                  = "eu-west-1"
  shared_credentials_file = "/home/ec2-user/.aws/credentials"
}

<<<<<<< HEAD
#module "vpc" {
#  source            = "./VPC"
#  availability_zone = var.availability_zone

#}
module "internet_gateway" {
  source = "./IGW"
  vpc_id = var.vpc_id
=======
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
>>>>>>> d7c0fc58b50f19706ce06e1d63377b978282d7b9
}

module "security_groups" {
  source = "./SG"
<<<<<<< HEAD
  vpc_id = var.vpc_id
=======
  vpc_id = module.vpc.vpc_id
>>>>>>> d7c0fc58b50f19706ce06e1d63377b978282d7b9
}

module "subnets" {
  source            = "./SUBNETS"
<<<<<<< HEAD
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
=======
  vpc_id            = module.vpc.vpc_id
  availability_zone = data.aws_availability_zones.available_zones.names[0]
>>>>>>> d7c0fc58b50f19706ce06e1d63377b978282d7b9
  security_group_id = module.security_groups.security_group_id
  private_nated_rt_association_id = module.route_table.private_nated_rt_association_id
}

module "nat" {
  source           = "./NAT"
  public_subnet_id = module.subnets.public_subnet_id
<<<<<<< HEAD

=======
  internet_gateway_id = module.internet_gateway.internet_gateway_id

}

module "route_table" {
  source              = "./RT"
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  public_subnet_id    = module.subnets.public_subnet_id
  private_subnet_id   = module.subnets.private_subnet_id
  nat_gateway_id      = module.nat.nat_gateway_id
>>>>>>> d7c0fc58b50f19706ce06e1d63377b978282d7b9
}

module "route_table" {
  source              = "./RT"
  vpc_id              = var.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  public_subnet_id    = module.subnets.public_subnet_id
  private_subnet_id   = module.subnets.private_subnet_id
  nat_gateway_id      = module.nat.nat_gateway_id
}