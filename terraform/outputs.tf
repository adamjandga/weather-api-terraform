output "cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "kubeconfig" {
  value = aws_eks_cluster.main.kubeconfig
}

output "repository_url" {
  value = aws_ecr_repository.weather_app.repository_url
}
