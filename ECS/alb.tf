module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "ECS-alb"

  load_balancer_type = "application"

  vpc_id             = data.terraform_remote_state.Network.outputs.vpc_id
  subnets            = data.terraform_remote_state.Network.outputs.public_subnets
  security_groups    = [module.alb_sg.security_group_id]

  access_logs = {
    bucket = "my-alb-logs"
  }

  target_groups = [
    {
      name_prefix      = "ECS-tf"
      backend_protocol = "HTTP"
      backend_port     = 80
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Test"
  }
}