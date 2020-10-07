variable "vpc_id" {
  description = "vpc id for route table"
}

variable "internet_gateway_id" {
  description = "internet gateway id for route table "
}

variable "public_subnet_id" {
  description = "public subnet id for route table"
}

variable "private_subnet_id" {
  description = "private subnet id for route table"
}

variable "nat_gateway_id" {
  description = "nat gateway id for route table"
}