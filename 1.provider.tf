provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = ">= 1.0.0, < 1.12.0" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 6.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "backedbucketlocalterra"
    key            = "Ansible.tfstate"
    region         = "ap-south-1"
    # dynamodb_table = "-terraform-locks"
    encrypt        = true
  }
}