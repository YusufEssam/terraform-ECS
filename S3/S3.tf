provider "aws" {
  region = local.region
}

locals {
  region = "eu-west-1"
  name   = "ecs-ex-${replace(basename(path.cwd), "_", "-")}"

  tags = {
    Name       = local.name
    Example    = local.name
  }
}
###############################
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "terraformtask"
  acl    = "public-read-write"

  versioning = {
    enabled = true
  }

}
