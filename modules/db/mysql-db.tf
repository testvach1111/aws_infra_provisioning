provider "aws" {
  region = "eu-north-1"
}

#create a RDS Database Instance
resource "aws_db_instance" "myinstance" {
  engine                 = "mysql"
  identifier             = "myrdsinstance"
  allocated_storage      = 20
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.mysql5.7"
  vpc_security_group_ids = ["${var.aws_security_group_rds_sg_id}"]
  multi_az               = true
  skip_final_snapshot    = true
  publicly_accessible    = true
}