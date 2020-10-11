module "subnets" {
  source                          = "./SUBNETS"
  vpc_id                          = var.vpc_id
  availability_zone               = var.availability_zone
  security_group_id               = var.security_group_id
  private_nated_rt_association_id = module.route_table.private_nated_rt_association_id
}

module "nat" {
  source           = "./NAT"
  public_subnet_id = module.subnets.public_subnet_id
  internet_gateway = var.internet_gateway

}

module "route_table" {
  source              = "./RT"
  vpc_id              = var.vpc_id
  internet_gateway_id = var.internet_gateway_id
  public_subnet_id    = module.subnets.public_subnet_id
  private_subnet_id   = module.subnets.private_subnet_id
  nat_gateway_id      = module.nat.nat_gateway_id
}