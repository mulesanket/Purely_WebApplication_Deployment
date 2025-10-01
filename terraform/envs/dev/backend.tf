terraform {
  backend "s3" {
    bucket         = "purely-webapp-tfstate-dev-us-east-1"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "purely-webapp-tfstate-lock-dev-us-east-1"
    encrypt        = true
  }
}
