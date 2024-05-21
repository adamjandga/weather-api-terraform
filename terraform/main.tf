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
  subnets         = ["subnet-0dd3c9084fffd80b7", "subnet-071b6572fe6bde046"]  # Replace with your subnet IDs
  vpc_id          = "vpc-0170b8d55652ec6f9"  # Replace with your VPC ID

  node_groups = {
    weather_app_nodes = {
      desired_capacity = 1
      max_capacity     = 10
      min_capacity     = 1

      instance_type = "t2.medium"
    }
  }
}

output "repository_url" {
  value = aws_ecr_repository.weather_app.repository_url
}

