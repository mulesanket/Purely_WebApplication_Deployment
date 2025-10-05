#VPC module configuration
module "vpc" {
  source = "../../modules/vpc"
  cluster_name = var.cluster_name
  name_prefix          = var.name_prefix
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
}

# Bastion host module configuration
module "bastion" {
  source           = "../../modules/bastion"
  name_prefix      = var.name_prefix
  vpc_id           = module.vpc.vpc_id
  subnet_id        = module.vpc.public_subnet_ids[0]
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  key_name         = var.key_name
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

# IAM module configuration
module "iam" {
  source       = "../../modules/iam"
  cluster_name = var.cluster_name
}

# EKS module configuration
module "eks" {
  source               = "../../modules/eks"
  cluster_name         = var.cluster_name
  eks_version          = var.eks_version
  eks_cluster_role_arn = module.iam.eks_cluster_role_arn
  private_subnet_ids   = module.vpc.private_subnet_ids
}