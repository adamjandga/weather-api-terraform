provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "weather_app" {
  name = "weather-app"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "weather-app"
  cluster_version = "1.21"
  subnets         = ["subnet-12345678", "subnet-23456789"]  # Replace with your subnet IDs
  vpc_id          = "vpc-12345678"  # Replace with your VPC ID

  node_groups = {
    weather_app_nodes = {
      desired_capacity = 1
      max_capacity     = 10
      min_capacity     = 1

      instance_type = "t2.micro"
    }
  }
}

output "repository_url" {
  value = aws_ecr_repository.weather_app.repository_url
}

