/*
Load Balancer output
*/
output "aws_lb_target_group_alb_tg_arn" {
  value       = aws_lb_target_group.alb_tg.arn
  description = "Load Balancer target group ID"
}

output "aws_lb_lb_id" {
  value       = aws_lb.lb.id
  description = "Load Balancer ID"
}
output "lb_dns" {
  value = aws_lb.lb.dns_name
  description = "Load balancer DNS name"
}