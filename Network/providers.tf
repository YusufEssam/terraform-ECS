terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.29"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "terraformtask"
    key    = "Network/terrform.tfstate"
    region = "eu-west-1"
  }
}


provider "aws" {
  region = var.aws_region
}