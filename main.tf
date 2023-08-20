terraform {
  required_version = ">= 0.12.26"
}

provider "aws" {
  access_key = 
  secret_key = 
  region     = "us-east-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-21augbucket22"
  acl    = "private"

  versioning {
    enabled = true
  }
}
