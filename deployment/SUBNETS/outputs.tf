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

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private_subnet.*.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
}

output "route_table_id" {
  value = aws_route_table.vpc_rt.id
}

output "private_nated_rt_association_id" {
  value = aws_route_table_association.private_nated_rt_association.id
}