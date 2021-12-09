
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "3.61.0"
    }
  }
}

# intialising S3 bucket to use it for storing terraform statefile
terraform {
  backend "s3" {
    bucket = "upgrad-naveen"
    key    = "m5/demo1/tfstatefile"
    region = "us-east-1"
  }
}

provider "aws" {
  # Configuration options to use which reagion to be used
  region = "us-east-1"
}