resource "aws_lb" "sightline_lb" {
  name               = "sightline-lb"
  internal           = false # Set to true if you want an internal (private) ELB
  load_balancer_type = "network" # You can choose "application" or "network" depending on your use case
  security_groups = [aws_security_group.elb_sg.id]
  subnets            = [aws_subnet.public_subnet.id,aws_subnet.public_subnet_2.id] # Subnets for the ELB
  enable_cross_zone_load_balancing = true
}

resource "aws_lb_target_group" "sightline_target_group" {
  name     = "sightline-target-group"
  port     = 80 # Port that your private instances are listening on
  protocol = "TCP" # Protocol used by your instances
  vpc_id   = aws_vpc.sightline_vpc.id
}

resource "aws_lb_target_group_attachment" "sightline_target_group_attachment" {
  target_group_arn = aws_lb_target_group.sightline_target_group.arn
  target_id        = aws_instance.private_instance.id
  port = 80
}

resource "aws_lb_listener" "sightline_listener" {
  load_balancer_arn = aws_lb.sightline_lb.arn
  port              = 80 # Port that clients will use to connect to the ELB
  protocol          = "TCP" # Protocol used by clients
  default_action {
    target_group_arn = aws_lb_target_group.sightline_target_group.arn
    type             = "forward"
  }
}


