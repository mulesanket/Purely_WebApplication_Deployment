# VPC module variables
variable "name_prefix" {
  description = "Name prefix for tagging and resource naming"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones to spread resources across"
  type        = list(string)
}

# Bastion host module variables
variable "ami_id" {
  description = "AMI ID for the bastion host"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the bastion host"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "SSH key pair name for accessing the bastion host"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into the bastion host"
  type        = string
}

#IAM module variables
variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

# EKS module variables
variable "eks_version" {
  type        = string
  description = "EKS cluster version"
  default     = "1.27"
}
