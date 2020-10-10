
data "aws_availability_zones" "available_zones" {
  state = "available"
}

#module "vpc" {
#  source            = "./VPC"
#  availability_zone = var.availability_zone

#}
module "internet_gateway" {
  source = "./IGW"
  vpc_id = var.vpc_id
}

module "security_groups" {
  source = "./SG"
  vpc_id = var.vpc_id
}

module "subnets" {
  source            = "./SUBNETS"
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  security_group_id = module.security_groups.security_group_id
  private_nated_rt_association_id = module.route_table.private_nated_rt_association_id
}

module "nat" {
  source           = "./NAT"
  public_subnet_id = module.subnets.public_subnet_id

}

module "route_table" {
  source              = "./RT"
  vpc_id              = var.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  public_subnet_id    = module.subnets.public_subnet_id
  private_subnet_id   = module.subnets.private_subnet_id
  nat_gateway_id      = module.nat.nat_gateway_id
}