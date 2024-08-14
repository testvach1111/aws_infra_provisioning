/*
Load Balancer module variables
*/
variable "aws_security_group_sg_for_elb_id" {
  type        = string
  description = "Security Group Load Balancer IDaws_security_group.sg_for_elb.id"
}

variable "aws_subnet_public_subnet_1_id" {
  type        = string
  description = "Public subnet 1 ID"
}

variable "aws_subnet_public_subnet_1a_id" {
  type        = string
  description = "Public subnet 1a ID"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"

}