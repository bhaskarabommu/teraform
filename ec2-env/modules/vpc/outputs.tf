output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main_igw.id
}

output "route_table_id" {
  value = aws_route_table.main_rt.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}

