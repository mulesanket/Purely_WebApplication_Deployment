
variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the bastion is launched"
  type        = string
}

variable "subnet_id" {
  description = "Public Subnet ID to launch bastion in"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for Ubuntu"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for bastion"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "Your public IP/CIDR block for SSH"
  type        = string
}
