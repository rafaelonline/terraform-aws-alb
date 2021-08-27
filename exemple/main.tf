provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-states"
    key    = "elb/terraform.tfstate"
    region = "us-east-1"
  }
}