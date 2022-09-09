variable "vpc" {
  description = "VPC ID"
  type        = string
}

variable "eks_cluster" {
  description = "eshop_cluster"
}

# variable "managed_policies" {
#   default = [
#     "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
#     "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
#     "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
#   ]
# }

# variable "aws_account_id" {
#   description = "AWS account ID"
#   type        = string
# }

# variable "kubernetes_version" {
#   description = "Kubernetes version to use for the EKS cluster and the worker nodes. Defaults to the latest EKS version."
#   type        = string
#   default     = "1.1"
# }


#vpc-5052c43b