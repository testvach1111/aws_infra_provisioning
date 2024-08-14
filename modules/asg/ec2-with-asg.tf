# ASG with Launch template
resource "aws_launch_template" "ec2_launch_templ" {
  name_prefix   = "ec2_launch_templ"
  image_id      = "ami-02af70169146bbdd3" # To note: AMI is specific for each region
  instance_type = "t3.micro"
  user_data     = filebase64("user_data.sh")

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = var.private_subnet_id
    //security_groups             = [aws_security_group.sg_for_ec2.id]
    security_groups = [var.aws_security_group_asg_sg_id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Web-Server-instance" # Name for the EC2 instances
    }
  }
}

resource "aws_autoscaling_group" "sh_asg" {
  # no of instances
  desired_capacity          = 2
  max_size                  = 3
  min_size                  = 1
  health_check_type         = "EC2"
  health_check_grace_period = 300

  # Connect to the target group
  target_group_arns = [var.aws_lb_target_group_alb_tg_arn]

  vpc_zone_identifier = [ # Creating EC2 instances in private subnet
    var.private_subnet_id
  ]

  launch_template {
    id      = aws_launch_template.ec2_launch_templ.id
    version = "$Latest"
  }
}