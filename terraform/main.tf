#Create ECR repository
resource "aws_ecr_repository" "eshop_rep" {
  name                 = "eshop-repository"
  image_tag_mutability = "MUTABLE"
}