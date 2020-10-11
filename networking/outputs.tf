output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "internet_gateway" {
  value = aws_internet_gateway.igw
}

output "security_group_id" {
  value = aws_security_group.sg.id
}
