#VPC module configuration
module "vpc" {
  source = "../../modules/vpc"

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

//EFS module configuration
module "efs" {
  source                = "../../modules/efs"
  name_prefix           = var.name_prefix
  private_subnet_ids    = module.vpc.private_subnet_ids
  efs_security_group_id = module.security.efs_sg_id
}

//Security group module configuration
module "security" {
  source = "../../modules/security"
  name_prefix = var.name_prefix
  vpc_id      = module.vpc.vpc_id
  allowed_ssh_cidr = var.allowed_ssh_cidr
  allowed_http_cidr = var.allowed_http_cidr
  allowed_https_cidr = var.allowed_https_cidr
}