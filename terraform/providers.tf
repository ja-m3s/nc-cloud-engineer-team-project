terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.0.1"
    }
  }

  required_version = ">= 1.3.7"
  /* Use S3 bucket and dynamo table as backend*/
  backend "s3" {
    bucket         = "project-bucket-3s-a-cloud"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "project-table-3s-a-cloud"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}
