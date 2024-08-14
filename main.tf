module "asg" {
  source                         = "./modules/asg"
  private_subnet_id              = module.network.private_subnet_2_id
  aws_security_group_asg_sg_id   = module.network.aws_security_group_sg_for_elb_id
  aws_lb_target_group_alb_tg_arn = module.load_balancer.aws_lb_target_group_alb_tg_arn
  aws_lb_lb_id                   = module.load_balancer.aws_lb_lb_id
}

module "load_balancer" {
  source                           = "./modules/load_balancer"
  aws_security_group_sg_for_elb_id = module.network.aws_security_group_sg_for_elb_id
  aws_subnet_public_subnet_1_id    = module.network.aws_subnet_public_subnet_1_id
  aws_subnet_public_subnet_1a_id   = module.network.aws_subnet_public_subnet_1a_id
  vpc_id                           = module.network.aws_vpc_vpc_main_id
  depends_on                       = [module.network.aws_internet_gateway_gw]
}

module "db" {
  source = "./modules/db"
  aws_security_group_rds_sg_id = module.network.aws_security_group_rds_sg_id
  db_username = var.db_username
  db_password = var.db_password
}

module "network" {
  source = "./modules/network"
}