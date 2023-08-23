terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    # dynamodb_table = "your-dynamodb-lock-table"
  }
}

provider "aws" {
  region = "us-east-1"
}


data "aws_eks_cluster_auth" "example" {
  name = module.eks_cluster.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.example.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.example.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.example.token
}