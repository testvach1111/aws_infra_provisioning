/*
DB module variables
*/
variable "aws_security_group_rds_sg_id" {
  type        = string
  description = "RDS Security Group ID"
}

variable "db_username" {
  type        = string
  description = "DB username"
}

variable "db_password" {
  type = string
  description = "DB password"
}