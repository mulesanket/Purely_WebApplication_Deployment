# EKS Cluster (control plane)
resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  version  = var.eks_version
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {

    subnet_ids = aws_subnet.private[*].id
    
    # API endpoint exposure (POC-friendly; you can tighten later)
    endpoint_public_access  = true
    endpoint_private_access = false
    public_access_cidrs     = var.cluster_api_cidrs

    security_group_ids = [aws_security_group.eks_cluster_sg.id]
  }

  tags = {
    Name = var.cluster_name
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy
  ]
}