provider "aws" {

  region                  = "eu-west-1"
  shared_credentials_file = "/home/ec2-user/.aws/credentials"
}


data "aws_availability_zones" "available_zones" {
  state = "available"
}

module "webserver_node" {
  source    = "./modules/EC2"
  public_subnet_id = module.my_vpc.public_subnet_id
  private_subnet_id = module.my_vpc.private_subnet_id
  availability_zone = "eu-west-1a"


}

module "my_vpc" {
  source = "./modules/VPC"

}


