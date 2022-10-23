provider "aws" {
  region = var.aws_region
}

###############################
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.bucket
  acl    = var.acl

  versioning = {
    enabled = true
  }

}
