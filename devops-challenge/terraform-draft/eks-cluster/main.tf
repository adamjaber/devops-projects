provider "aws" {
  region = var.region
  access_key = "xx"
  secret_key = "xxxx"

}

terraform {
  backend "s3" {
    bucket         = "eks-terraform-statefile-assignment" 
    key            = "terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
  }
}


resource "aws_eks_cluster" "my_cluster" {
  name     = var.cluster-name
  role_arn = aws_iam_role.my_cluster_role.arn

  vpc_config {
    subnet_ids = var.sunbets
  }

  depends_on = [aws_iam_role_policy_attachment.cluster_amazon_managed_policy]  # for deletion ro creation priority
}

resource "aws_iam_role" "my_cluster_role" {
  name = "my-eks-cluster-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "cluster_amazon_managed_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.my_cluster_role.name
}

resource "aws_iam_instance_profile" "my_cluster_instance_profile" {
  name = "my-eks-cluster-instance-profile"
  role = aws_iam_role.my_cluster_role.name
}

resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "example"
  node_role_arn   = aws_iam_role.example.arn
  subnet_ids      = var.sunbets
  instance_types  = ["t3.medium"]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_iam_role" "example" {
  name = "eks-node-group-example"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.example.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.example.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.example.name
}
