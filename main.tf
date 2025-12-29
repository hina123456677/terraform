provider "aws" {
  region = var.region
}

resource "aws_security_group" "apache_sg" {
  name        = var.sg_name
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    description = "HTTP"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = var.sg_name
  }
}

resource "aws_instance" "apache_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.apache_sg.name]

  tags = {
    Name = "Terraform-Apache-AmazonLinux"
  }
}

output "ec2_public_ip" {
  value       = aws_instance.apache_server.public_ip
  description = "Public IP of Apache server"
}