module "eks_cluster" {
  source       = "./modules/eks-cluster"
  cluster_name = "calculator-eks-cluster"
  subnet_ids   = ["", ""]
}

data "aws_eks_cluster" "example" {
  name = module.eks_cluster.cluster_name
}


module "eks_node_group" {
  source            = "./modules/eks-node-group"
  cluster_name      = module.eks_cluster.cluster_name
  node_group_name   = "calculator-node-group"
  subnet_ids        = ["", ""]
  instance_types    = ["t2.small"]
  scaling_config    = {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }
  update_config     = {
    max_unavailable = 1
  }
}

module "application_deployment" {
  source       = "./modules/application-deployment"
  namespace    = "calculator-application"
  cluster_name = module.eks_cluster.cluster_name
}


