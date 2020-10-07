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

variable "availability_zone" {
  description = "availability zone"
}

variable "public_subnet_id" {
  description = "public subnet id"
}

variable "private_subnet_id" {
  description = "private subnet id"
}