// modules/vpc/outputs.tf

output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = [aws_subnet.public_a.id, aws_subnet.public_b.id]
}

output "private_subnet_ids" {
  value = [aws_subnet.private_a.id, aws_subnet.private_b.id]
}

output "nat_gateway_ids" {
  value = [aws_nat_gateway.a.id, aws_nat_gateway.b.id]
}

output "db_instance_id" {
  value = aws_db_instance.this.id
}

