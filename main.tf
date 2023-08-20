terraform {
  required_version = ">= 0.12.26"
}

provider "aws" {
  access_key = "AKIASGJGM6EF3CNCJKJK"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-18augbucket22"
  acl    = "private"

  versioning {
    enabled = true
  }
}