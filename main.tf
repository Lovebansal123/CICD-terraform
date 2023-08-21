terraform {
  required_version = ">= 0.12.26"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  access_key = "AKIASHELXOYST4ECEYN6"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-21augbucket22"
  acl    = "private"

  versioning {
    enabled = true
  }
}
#Variable Declaration
variable "key_pair_name" {
  type    = string
  default = "demokeypair"
}
#Variable Declaration
variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCQ8J4nucKMcfoSxaNSOwiWUeR+/Oy+ax+kxuQync42QCq+GiCVfHNu6usD3KU0lrcv6TI0hoi5inlOoHqHTdBnXgL4pyKPDNV42VPl7G7QSK6nYfl+JA86mmJ4cgT8SrBhZ8JtkmEa9OyBnkYlaCBikpF/7uA8Rzd2lLhTC/xqsNrH7ltPbtsxoeEQ11WhM5tlNInPIZciC6esZvtxiBCXkHx8lnrUfb3adfz29K3yY63r4CLsnu8HJe/QYpuADAqfPfG+M+CMsMdkDAZnv+1I9/V9s6L50pNjxSbIKayvevcx310e4Crl+Yl4v141aD5n4XCakRxhTBYXqEmN4hH1"
}

#Resource to Create Key Pair
resource "aws_key_pair" "demo_key_pair" {
  key_name   = var.key_pair_name
  public_key = var.public_key
}

resource "aws_instance" "demo-instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.demo_key_pair.key_name
}