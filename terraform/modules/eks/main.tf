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

#Core EKS add-ons
resource "aws_eks_addon" "vpc_cni" {
  cluster_name                  = aws_eks_cluster.this.name
  addon_name                    = "vpc-cni"
  resolve_conflicts_on_create   = "OVERWRITE"
  resolve_conflicts_on_update   = "OVERWRITE"

  depends_on = [aws_eks_cluster.this]
}

# kube-proxy 
resource "aws_eks_addon" "kube_proxy" {
  cluster_name                  = aws_eks_cluster.this.name
  addon_name                    = "kube-proxy"
  resolve_conflicts_on_create   = "OVERWRITE"
  resolve_conflicts_on_update   = "OVERWRITE"

  depends_on = [aws_eks_cluster.this]
}

# CoreDNS 
resource "aws_eks_addon" "coredns" {
  cluster_name                  = aws_eks_cluster.this.name
  addon_name                    = "coredns"
  resolve_conflicts_on_create   = "OVERWRITE"
  resolve_conflicts_on_update   = "OVERWRITE"

  depends_on = [aws_eks_cluster.this]
}

# EKS Cluster Node Group
resource "aws_eks_node_group" "default" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.cluster_name}-ng"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = aws_subnet.private[*].id    

  scaling_config {
    min_size     = 2
    desired_size = 2
    max_size     = 6
  }

  instance_types = ["t3.medium"]
  capacity_type  = "ON_DEMAND"
  ami_type       = "AL2_x86_64"

  update_config { max_unavailable = 1 }
}
