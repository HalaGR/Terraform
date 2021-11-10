terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  //access key values
}

module "S3" {
    source = ".//modules/S3/"
    #bucket name should be unique
    bucket_name = "final-task-s3"       
}