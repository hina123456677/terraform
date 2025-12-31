provider "aws" {
  region = local.region
}

locals {
  # General configuration
  region        = "us-east-1"
  ami_id        = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  key_name      = "my-ec2-key"

  # Instance MAP (used with for_each)
  instance_names = {
    apache1 = "Apache-1"
    apache2 = "Apache-2"
    apache3 = "Apache-3"
  }

  # Security group configuration
  sg_name     = "apache_sg"
  cidr_blocks = ["0.0.0.0/0"]
  ssh_port    = 22
  http_port   = 80

  # Egress rule
  egress_port     = 0
  egress_protocol = "-1"
}

# Security Group
resource "aws_security_group" "apache_sg" {
  name        = local.sg_name
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    from_port   = local.ssh_port
    to_port     = local.ssh_port
    protocol    = "tcp"
    cidr_blocks = local.cidr_blocks
  }

  ingress {
    description = "HTTP"
    from_port   = local.http_port
    to_port     = local.http_port
    protocol    = "tcp"
    cidr_blocks = local.cidr_blocks
  }

  egress {
    from_port   = local.egress_port
    to_port     = local.egress_port
    protocol    = local.egress_protocol
    cidr_blocks = local.cidr_blocks
  }

  tags = {
    Name = local.sg_name
  }
}

# EC2 Instances
resource "aws_instance" "apache_server" {
  for_each        = local.instance_names
  ami             = local.ami_id
  instance_type   = local.instance_type
  key_name        = local.key_name
  security_groups = [aws_security_group.apache_sg.name]

  tags = {
    Name = each.value
  }
}

# Output
output "ec2_public_ip" {
  value       = { for k, v in aws_instance.apache_server : k => v.public_ip }
  description = "Public IPs of Apache servers"
}
