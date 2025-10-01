//VPC module variables
name_prefix          = "my-app"
vpc_cidr             = "10.0.0.0/16"
aws_region           = "ap-south-1"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
azs                  = ["ap-south-1a", "ap-south-1b"]

//Bastion host module variables
ami_id           = "ami-020cba7c55df1f615"
instance_type    = "t2.micro"
key_name         = "mumbai-keypair"
allowed_ssh_cidr = "0.0.0.0/0"

//EFS module variables
