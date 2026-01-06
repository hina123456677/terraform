provider "aws" {
  region = var.region
}

# IAM Role
resource "aws_iam_role" "read_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = var.service_name
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach Read-Only Policy
resource "aws_iam_role_policy_attachment" "read_policy" {
  role       = aws_iam_role.read_role.name
  policy_arn = var.policy_arn
}

# Instance Profile (needed for EC2)
resource "aws_iam_instance_profile" "read_profile" {
  name = "${var.role_name}-profile"
  role = aws_iam_role.read_role.name
}
