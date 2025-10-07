terraform {
  backend "s3" {
    bucket         = "purely-webapp-tfstate-dev-us-east-1"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "purely-webapp-tfstate-lock-us-east-1"
    encrypt        = true
  }
}
