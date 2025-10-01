variable "name_prefix" {
  type = string
}

variable "vpc_id" {
  description = "VPC ID where the bastion is launched"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}