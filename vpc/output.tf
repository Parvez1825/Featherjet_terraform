output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_ids" {
  value = aws_subnet.subnet[*].id
}

output "subnet_id_private" {
  value = aws_subnet.subnet-private[*].id
}

output "public" {
  value = aws_route_table.public[*].id
}

# output "private" {
#   value = aws_route_table.private[*].id
# }

