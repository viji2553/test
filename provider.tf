terraform {

  required_version = ">= 0.14.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.22.0"
    }
  }
  backend "s3" {
    bucket  = "vijaystate"
    key     = "terraform.tfstate"
    region  = "ap-south-1"
    dynamodb_table = "viji1"
  }
}


provider "aws" {
  region = "ap-south-1"
}
