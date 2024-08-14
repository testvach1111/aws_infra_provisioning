/*
Network output
*/
output "private_subnet_2_id" {
  value       = aws_subnet.private_subnet_2.id
  description = "Private subnet 2 ID"
}

output "aws_security_group_rds_sg_id" {
  value       = aws_security_group.rds_sg.id
  description = "RDS Security Groupd ID"
}

output "aws_security_group_sg_for_elb_id" {
  value       = aws_security_group.sg_for_elb.id
  description = "Security Group for Load Balancer ID"
}

output "aws_subnet_public_subnet_1_id" {
  value       = aws_subnet.public_subnet_1.id
  description = "Public subnet 1 ID"
}

output "aws_subnet_public_subnet_1a_id" {
  value       = aws_subnet.public_subnet_1a.id
  description = "Public subnet 1a ID"
}

output "aws_vpc_vpc_main_id" {
  value       = aws_vpc.vpc_main.id
  description = "VPC main ID"
}

output "aws_internet_gateway_gw" {
  value       = aws_internet_gateway.gw
  description = "Gateway ID"
}