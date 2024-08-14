resource "aws_lb" "lb" {
  name               = "lb-asg"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.aws_security_group_sg_for_elb_id]
  subnets            = [var.aws_subnet_public_subnet_1_id, var.aws_subnet_public_subnet_1a_id]
}

resource "aws_lb_target_group" "alb_tg" {
  name     = "tf-lb-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}