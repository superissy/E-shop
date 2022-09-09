resource "aws_ecr_repository_policy" "e-shop-repo-policy" {
  repository = aws_ecr_repository.eshop_rep.name

  policy = jsonencode(
    {
      "Version" : "2008-10-17",
      "Statement" : [
        {
          "Sid" : "Add full ECR access to our repo",
          "Effect" : "Allow",
          "Principal" : {
            "AWS" : "*"
          },
          "Action" : [
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage",
            "ecr:BatchCheckLayerAvailability",
            "ecr:PutImage",
            "ecr:InitiateLayerUpload",
            "ecr:UploadLayerPart",
            "ecr:CompleteLayerUpload"
          ]
        }
      ]
    }
  )
}


# resource "aws_iam_role_policy_attachment" "eks_node_group_policy" {
#   role       = "arn:aws:iam::${var.aws_account_id}:role/EKSworkerNodePolicy"
#   count      = length(var.managed_policies)
#   policy_arn = element(var.managed_policies, count.index)
# }

# resource "aws_iam_role_policy_attachment" "eks_service_role_eks_node_group_policy" {
#   role       = "arn:aws:iam::${var.aws_account_id}:role/aws-service-role/eks-nodegroup.amazonaws.com/AWSServiceRoleForAmazonEKSNodegroup"
#   policy_arn = "arn:aws:iam::aws:policy/AmazonServiceRoleForAmazonEKSNodeGroup"
# }

# resource "aws_iam_role_policy_attachment" "eks_service_role_amazon_eks" {
#   role       = "arn:aws:iam::${var.aws_account_id}:role/aws-service-role/eks.amazonaws.com/AWSServiceRoleForAmazonEKS"
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
# }