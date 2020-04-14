output "vpc_id" {
  value = var.vpc_id
}

output "subnet_id" {
  value = aws_subnet.subnet[*].id
}

output "cidr_blocks" {
  value = var.cidr_blocks[*]
}
