terraform {
  backend "s3" {
    bucket         = "depi-hellal"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "depi-qal"
  }
}