# AWS region
region = "us-east-1"

# AMI ID for the EC2 instance
ami_id = "ami-0b5eea76982371e91" # Example Amazon Linux 2 AMI

# EC2 instance type
instance_type = "t2.micro"

# object instead of LIST

instance = { name = "Apache-1", type = "t2.micro" }

# Key pair for SSH access
key_name = "my-ec2-key"

# Security group name
sg_name = "apache_sg"

# Allowed CIDR blocks
cidr_blocks = ["0.0.0.0/0"]

# SSH and HTTP ports
ssh_port  = 22
http_port = 80

# Egress rule (single static rule)
egress_port     = 0
egress_protocol = "-1"

# Number of EC2 instances
instance_count = 3