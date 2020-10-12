variable "vpc_id" {
  description = "vpc id for subnets"
}

variable "subnet_cidr_blocks_pub" {
  description = "cidr blocks for subnets"
}

variable "subnet_cidr_blocks_priv" {
  description = "cidr blocks for subnets"
}

variable "availability_zone" {
  description = "availability zone"
}

variable "internet_gateway" {
  description = "internet gateway for nat gateway"
}

variable "internet_gateway_id" {
  description = "internet gateway id for route table "
}




