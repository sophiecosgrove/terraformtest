provider "aws" {

  region                  = "eu-west-1"
  shared_credentials_file = "/home/ec2-user/.aws/credentials"
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

data "aws_subnet_ids" "public_subnet_ids" {
  vpc_id = aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["public_subnet"]
  }
}

data "aws_subnet_ids" "private_subnet_ids" {
  vpc_id = aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["private_subnet"]
  }
}

module "autoscaling_group" {
  source              = "./autoscaling"
  security_group_pub  = module.networking.security_group_id
  security_group_priv = module.networking.security_group_id_priv
  load_balancers      = [module.elastic_load_balancer.elb_id]
  public_subnet_ids   = data.aws_subnet_ids.public_subnet_ids.ids
  private_subnet_ids  = data.aws_subnet_ids.private_subnet_ids.ids
  depends_on          = [module.subnets]



}
# Private and public subnets replicated across availability zones
module "subnets" {
  source                  = "./SUBNETS"
  count                   = length(data.aws_availability_zones.available_zones.names)
  availability_zone       = data.aws_availability_zones.available_zones.names[count.index]
  vpc_id                  = aws_vpc.vpc.id
  subnet_cidr_blocks_pub  = var.cidr_block_pub[count.index]
  subnet_cidr_blocks_priv = var.cidr_block_priv[count.index]
  internet_gateway_id     = module.networking.internet_gateway_id
  internet_gateway        = module.networking.internet_gateway

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
  public_instances   = module.autoscaling_group.public_instances
  depends_on         = [module.subnets]

}
