
module "alb_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "alb_security_groups"
  vpc_id      = data.terraform_remote_state.Network.outputs.vpc_id

  # Ingress for HTTP
  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_ipv6_cidr_blocks = ["::/0"]
  ingress_rules            = ["http-80-tcp"]

  # Allow all egress
  egress_cidr_blocks      = ["0.0.0.0/0"]
  egress_ipv6_cidr_blocks = ["::/0"]
  egress_rules            = ["all-all"]
}

module "ECS_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ecs-task"
  vpc_id      = data.terraform_remote_state.Network.outputs.vpc_id

   # Ingress from ALB only
  number_of_computed_ingress_with_source_security_group_id = 1
  computed_ingress_with_source_security_group_id = [
    {
      rule                     = "all-all"
      source_security_group_id = module.alb_sg.security_group_id
    }
  ]

  # Allow all egress
  egress_cidr_blocks      = ["0.0.0.0/0"]
  egress_ipv6_cidr_blocks = ["::/0"]
  egress_rules            = ["all-all"]
  
}