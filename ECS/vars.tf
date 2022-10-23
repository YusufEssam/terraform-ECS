variable "aws_region" {
  description = "What is the selected Region"
  default     = "eu-west-1"
}

variable "min_size" {
  description = "minimum scaling step size to provision."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "maximum scaling step size to provision."
  type        = number
  default     = 5
}

variable "instance_type_1" {
  description = "The type of the instances"
  type        = string
  default     = "t3.micro"
}

variable "instance_type_2" {
  description = "The type of the instances"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "SSH Key Name"
  default     = "Terraform-key"
}

variable "deploy_max_percent" {
  description = "deployment maximum percent "
  type        = number
  default     = 60
}

variable "deploy_min_percent" {
  description = "deployment minimum healthy percent"
  type        = number
  default     = 2
}