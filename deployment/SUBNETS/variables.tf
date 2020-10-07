variable "vpc_id" {
  description = "vpc id for subnets"
}

variable "subnet_cidr_blocks" {
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "availability_zone" {
  description = "availability zone"
}