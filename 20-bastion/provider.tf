terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  backend "s3" {
    bucket = "s3bucketpolicytest-6792"
    key    = "roboshop-dev-bastion"
    region = "us-east-1"
    encrypt        = true
    
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
