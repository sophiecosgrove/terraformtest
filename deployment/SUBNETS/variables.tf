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

variable "ami" {
  default = "ami-0bb3fad3c0286ebd5"
}

variable "type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "mac"
}

variable "associate_public_ip_address" {
  default = true
}

variable "security_group_id" {
  description = "security group id for instance"
}

variable "security_group_id_priv" {
  description = "security group id for instance"
}

variable "private_nated_rt_association_id" {
  description = "private nated route table id for private subnet"
}