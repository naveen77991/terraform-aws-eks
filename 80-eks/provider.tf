terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      
    }
  }

  backend "s3" {
    bucket = "439481669447"
    key    = "roboshop-dev-eks"
    region = "us-east-1"
   
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
