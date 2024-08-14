/*
ASG module variables
*/
variable "private_subnet_id" {
  type        = string
  description = "Private subnet ID"
}

variable "aws_security_group_asg_sg_id" {
  type        = string
  description = "Auto scaling group security group ID"
}

variable "aws_lb_target_group_alb_tg_arn" {
  type        = string
  description = "Load Balancer Target Group ARN"

}

variable "aws_lb_lb_id" {
  type        = string
  description = "Load Balancer ID"

}