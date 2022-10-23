variable "aws_region" {
  description = "What is the selected Region"
  default     = "eu-west-1"
}

variable "bucket" {
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = "terraformtask"
}

variable "acl" {
  description = "(Optional) The canned ACL to apply. Conflicts with `grant`"
  type        = string
  default     = "public-read-write"
}