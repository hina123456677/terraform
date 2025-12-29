# AWS region
variable "region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "us-east-1"
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
  default     = "t2.micro"
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
  default     = "apache_sg"
}

# Allowed CIDR blocks
variable "cidr_blocks" {
  description = "List of allowed CIDR blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# Ports for ingress rules
variable "ssh_port" {
  description = "SSH port"
  type        = number
  default     = 22
}

variable "http_port" {
  description = "HTTP port"
  type        = number
  default     = 80
}

# Egress rules
variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}