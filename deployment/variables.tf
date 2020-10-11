variable "availability_zone" {
  description = "availability_zone"
}

variable "vpc_id" {
  description = "vpc id"
}

variable "security_group_id" {
  description = "security group id"
}

variable "security_group_id_priv" {
  description = "security group id for instance"
}

variable "internet_gateway_id" {
  description = "internet gateway id"
}

variable "internet_gateway" {
  description = "internet gateway"
}

variable "subnet_cidr_blocks_pub" {
  description = "cidr blocks for subnets"
}

variable "subnet_cidr_blocks_priv" {
  description = "cidr blocks for subnets"
}
