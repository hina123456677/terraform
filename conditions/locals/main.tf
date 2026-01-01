provider "aws" {
  region = local.region
}

locals {
  # General configuration
  region        = "us-east-1"
  ami_id        = "ami-0b5eea76982371e91"
  instance_count = 2
  instance_type = "t2.micro"
  key_name      = "my-ec2-key"
   env          =    "dev"
  # Security group
  sg_name     = "apache_sg"
  cidr_blocks = ["0.0.0.0/0"]
  ssh_port    = 22
  http_port   = 80

  # Egress rule (single, fixed)
  egress_port = 0
  egress_protocol  = "-1"
}

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

resource "aws_instance" "apache_server" {
  ami             = local.ami_id
  count           = local.instance_count
  instance_type   = local.env == "dev" ? "t2.medium" : "t2.micro"
  key_name        = local.key_name
  security_groups = [aws_security_group.apache_sg.name]

  tags = {
    Name = "Terraform-Apache-AmazonLinux-${count.index}"
  }
}

output "ec2_public_ip" {
  value       = aws_instance.apache_server[*].public_ip
  description = "Public IP of Apache server"
}
 