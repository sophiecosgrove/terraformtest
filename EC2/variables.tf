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