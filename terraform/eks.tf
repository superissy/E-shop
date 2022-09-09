module "eks_blueprints" {
  source             = "github.com/aws-ia/terraform-aws-eks-blueprints?ref=v4.0.2"
  cluster_name       = "eks-blueprints"
  cluster_version    = "1.21"
  vpc_id             = var.vpc
  private_subnet_ids = data.aws_subnet_ids.subnet_ids.ids

  managed_node_groups = {
    mg_m5 = {
      instance_types  = ["t2.micro"]
      node_group_name = "eshop_nodegroup"
      subnet_ids      = data.aws_subnet_ids.subnet_ids.ids
    }
  }

}

data "aws_subnet_ids" "subnet_ids" {
  vpc_id = var.vpc
}

data "aws_subnet" "subnet" {
  for_each = data.aws_subnet_ids.subnet_ids.ids # for_each is a new feature in Terraform 0.12 [subnet1, subnet2, subnet3]
  id       = each.value
}
data "aws_vpc" "vpc" {
  id = var.vpc
}
