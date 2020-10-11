output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public_subnet.*.id
}