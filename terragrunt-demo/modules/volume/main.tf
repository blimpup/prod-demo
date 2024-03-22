# ---------------------------------------------------------------------------------------------------------------------
# A SIMPLE EXAMPLE OF HOW TO DEPLOY AN EBS VOLUME
# This is an example of how to use Terraform to deploy an EBS volume
#
# Note: This code is meant solely as a simple demonstration of how to lay out your files and folders with Terragrunt
# in a way that keeps your Terraform code DRY. This is not production-ready code, so use at your own risk.
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  # Live modules pin exact provider version; generic modules let consumers pin the version.
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE EBS VOLUME
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_ebs_volume" "example" {
  count = var.volume_count
  availability_zone = "us-east-1a"
  size              = var.size

  tags = {
    Name = "HelloWorld"
  }
}
