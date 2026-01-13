variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "my-ecs-cluster"
}

variable "container_name" {
  default = "my-app"
}

variable "container_image" {
  default = "nginx:latest"  # Docker Hub image
}

variable "cpu" {
  default = "256"
}

variable "memory" {
  default = "512"
}

variable "desired_count" {
  default = 1
}

variable "vpc_id" {
  description = "VPC ID where ECS Fargate will run"
}

variable "subnets" {
  description = "List of subnet IDs for ECS tasks"
  type        = list(string)
}