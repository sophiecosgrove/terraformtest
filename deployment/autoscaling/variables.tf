variable "key_name" {
  default = "mac"
}

variable "security_group_pub" {
    description = "id"
}

variable "security_group_priv" {
    description = "id"
}

variable "associate_public_ip_address" {
  default = true
}

variable "load_balancers" {
    description = "names, list"
}

variable "public_subnet_ids" {
    description = "ids of public subnets"
}

variable "private_subnet_ids" {
    description = "ids of private subnets"
}