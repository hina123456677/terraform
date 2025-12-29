# AWS region
region = "us-east-1"

# AMI ID for the EC2 instance
ami_id = "ami-0b5eea76982371e91" # Example Amazon Linux 2 AMI, replace with your region's AMI

# EC2 instance type
instance_type = "t2.micro"

# Key pair for SSH access
key_name = "my-ec2-key"

# Security group name
sg_name = "apache_sg"

# Allowed CIDR blocks
cidr_blocks = ["0.0.0.0/0"]

# SSH and HTTP ports
ssh_port  = 22
http_port = 80

# Egress rules
egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]