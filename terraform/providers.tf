terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = ">= 4.0"
  }

  backend "s3" {
    region         = "us-east-1"
    bucket         = "altschool-tf-state"
    key            = "exam/terraform.tfstate"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}