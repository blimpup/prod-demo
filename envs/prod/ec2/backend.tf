terraform {
  backend "s3" {
    bucket = "terrateam-test-bucket"
    key    = "states/envs/prod/ec2"
    region = "us-east-1"
  }
}
