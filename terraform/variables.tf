variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "weather-app"
}

variable "node_group_name" {
  description = "Name of the Node Group"
  type        = string
  default     = "weather-app-node-group"
}

variable "endpoint_private_access" {
  type        = bool
  default     = true
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
}

variable "endpoint_public_access" {
  type        = bool
  default     = true
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
}

variable "eks_cluster_subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs. Must be in at least two different availability zones."
  default     = ["subnet-0dd3c9084fffd80b7", "subnet-071b6572fe6bde046"]
}

variable "ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Defaults to AL2_x86_64."
  type        = string 
  default     = "AL2_x86_64"
}

variable "disk_size" {
  description = "Disk size in GiB for worker nodes. Defaults to 20."
  type        = number
  default     = 20
}

variable "instance_types" {
  type        = list(string)
  default     = ["t3.medium"]
  description = "Set of instance types associated with the EKS Node Group."
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  default     = 1
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes."
  default     = 10
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes."
  default     = 1
  type        = number
}

variable "cluster_sg_name" {
  description = "Name of the EKS cluster Security Group"
  type        = string
  default     = "eks-cluster-sg"
}

variable "nodes_sg_name" {
  description = "Name of the EKS node group Security Group"
  type        = string
  default     = "eks-nodes-sg"
}

variable "vpc_id" {
  description = "VPC ID from which belongs the subnets"
  type        = string
  default     = "vpc-0170b8d55652ec6f9"
}
