variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "cidr_block_pub" {
  default = ["10.0.0.0/24", "10.0.2.0/24", "10.0.4.0/24", ]
}

variable "cidr_block_priv" {
  default = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
}