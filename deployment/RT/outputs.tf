output "route_table_id" {
  value = aws_route_table.vpc_rt.id
}

output "private_nated_rt_association_id" {
  value = aws_route_table_association.private_nated_rt_association.id
}