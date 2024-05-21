provider "aws" {
  region = "us-east-1"  # Change this if needed
}

resource "aws_ecr_repository" "weather_app" {
  name = "weather-app"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "weather-app"
  cluster_version = "1.21"
  
  # Replace with your actual VPC ID and subnet IDs
  vpc_id          = "vpc-0170b8d55652ec6f9"
  subnets         = ["subnet-0dd3c9084fffd80b7", "subnet-071b6572fe6bde046"]

  node_groups = {
    weather_app_nodes = {
      desired_capacity = 1
      max_capacity     = 10
      min_capacity     = 1
      instance_type    = "t3.medium"

      # Optional tags for the node group
      tags = {
        Name        = "weather-app-node-group"
        Environment = "production"
      }
    }
  }
  
  # Optional tags for the cluster
  tags = {
    Environment = "production"
    Project     = "WeatherApp"
  }
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}

output "repository_url" {
  value = aws_ecr_repository.weather_app.repository_url
}
