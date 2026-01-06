variable "region" {
  type    = string
  default = "us-east-1"
}

variable "role_name" {
  type    = string
  default = "ec2-reading-role"
}

variable "service_name" {
  type    = string
  default = "ec2.amazonaws.com"
}

variable "policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}