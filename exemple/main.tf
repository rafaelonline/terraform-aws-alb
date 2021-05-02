provider "aws" {
  region  = "us-east-1"
  profile = "pessoal"
}

terraform {
  backend "s3" {
    profile = "pessoal"
    bucket  = "terraform-states"
    key     = "elb/terraform.tfstate"
    region  = "us-east-1"
  }
}