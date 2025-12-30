# AWS region
variable "region" {
  description = "AWS region to create resources in"
  type        = string
}

# AMI ID for EC2 instance
variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

# EC2 instance type
variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

# Key pair name for SSH access
variable "key_name" {
  description = "Key pair name to access EC2 instance"
  type        = string
}

# Security Group Name
variable "sg_name" {
  description = "Security group name"
  type        = string
}

# Allowed CIDR blocks
variable "cidr_blocks" {
  description = "List of allowed CIDR blocks"
  type        = list(string)
}

# Ports for ingress rules
variable "ssh_port" {
  description = "SSH port"
  type        = number
}

variable "http_port" {
  description = "HTTP port"
  type        = number
}

variable "egress_port" {
  description = "Egress from and to port (set 0 for all ports)"
  type        = number
}

variable "egress_protocol" {
  description = "Egress protocol"
  type        = string
}

# Number of EC2 instances
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}