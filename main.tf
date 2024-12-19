terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "terrateam-test-bucket"
    key    = "states/envs/prod-demo/root.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "ec2_instance" {
   ami           = "ami-04e914639d0cca79a"
   instance_type = "t2.micro"
}
