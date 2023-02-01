resource "aws_elb" "bar" {
  name               = "aman-terraform-elb"
  availibility_zones = ["us-east-2a", "us-east-2b"]
 
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  
  health check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }
 
  instances                 = ["$(aws_instance.one.id)", "$(aws_instance.two.id)"]
  cross_zone_load_balancing = true
  idle_timeout              = 400
  tags = {
    Name = "aman-tf-elb"
  }
}

