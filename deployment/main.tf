
data "aws_availability_zones" "available_zones" {
  state = "available"
}

module "instances" {
  source    = "./EC2"
  public_subnet_id = module.subnets.public_subnet_id
  private_subnet_id = module.subnets.private_subnet_id
  availability_zone = data.aws_availability_zones.available.names[0]
}

module "vpc" {
  source = "./VPC"
  availability_zone = data.aws_availability_zones.available.names[0]

}

module "internet_gateway" {
    source = "./IGW"
    vpc_id = module.vpc.vpc_id
}

module "route_table" {
    source = "./RT"
    vpc_id = module.vpc.vpc_id
    internet_gateway_id = module.internet_gateway.internet_gateway_id
    public_subnet_id = module.subnets.public_subnet_id
}

module "security_groups" {
    source = "./SG"
    vpc_id = module.vpc.vpc_id
}

module "subnets" {
    source = "./SUBNETS"
    vpc_id = module.vpc.vpc_id
    availability_zone = data.aws_availability_zones.available.names[0]
}

