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

  egress {
    from_port   = var.egress_port
    to_port     = var.egress_port
    protocol    = var.egress_protocol
    cidr_blocks = var.cidr_blocks
  }

  tags = {
    Name = var.sg_name
  }
}

resource "aws_instance" "apache_server" {
  ami           = var.ami_id
  instance_type = var.instance.type   # Use object property
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.apache_sg.id]

  tags = {
    Name = var.instance.name
  }
}

output "ec2_public_ip" {
  value       = aws_instance.apache_server.public_ip
  description = "Public IP of Apache server"
}
