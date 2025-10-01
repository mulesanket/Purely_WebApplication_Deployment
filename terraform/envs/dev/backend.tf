terraform {
  backend "s3" {
    bucket         = "myapp-tfstate-dev-ap-south-1"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "myapp-tfstate-lock-dev-ap-south-1"
    encrypt        = true
  }
}
