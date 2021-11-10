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
  access_key = "AKIATTDC4KMEMCZZRTWK" // add your own key valuse here
  secret_key = "8nykO0/YW7FqE9t98/Y5HkrhA2Zoog+DV0dFNZiL"
}

module "S3" {
    source = ".//modules/S3/"
    #bucket name should be unique
    bucket_name = "final-task-s3"       
}

module "vpc" {
  source = ".//modules/vpc/"
  vpc_name = "default-vpc"
}


module "web-app-az-1" {
  source = ".//modules/instance/"

  instance_type = "t2.micro"
  availability_zone = "eu-west-1c"
  instance_name_tag = "web-server-"
}

module "web-apppaz-2" {
  source = ".//modules/instance/"

  instance_type = "t2.micro"
  availability_zone = "eu-west-1b"
  instance_name_tag = "web-server-"
}
