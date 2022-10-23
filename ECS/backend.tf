data "terraform_remote_state" "Network" {
  backend = "s3"
  config = {
    bucket = "terraformtask"
    key    = "Network/terrform.tfstate"
    region = "eu-west-1"
  }
}