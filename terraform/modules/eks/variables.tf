
variable "cluster_name" {
  type = string
}

variable "eks_version" {
  type = string
}

variable "cluster_api_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}