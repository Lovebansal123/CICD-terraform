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
  default = "MIIEowIBAAKCAQEAkPCeJ7nCjHH6EsWjUjsIllHkfvzsvmsfpMbkMp3ONkAqvhoglXxzburrA9ylNJa3L+kyNIaIuYp5TqB6h03QZ14C+KcijwzVeNlT5exu0Eiup2H5fiQPOppieHIE/EqwYWfCbZJhGvTsgZ5GJWggYpKRf+7gPEc3dpS4Uwv8arDax+5bT27bMaHhENdVoTObZTSJzyGXIgunrGb7cYgQl5B8fJZ61H292nX89vSt8mOt6+Ai7J7vByXv0GKbgAwKnz3xvjPgjLDHZAwGZ7/tSPf1fbOi+dKTY8UmyCmsr3r3Md9dHuAq5fmJeL9eNWg+Z+FwmpEcYUwWF6hJjeIR9QIDAQABAoIBAE8xKTjLZmEWZWycUAA+ARMg65f22eOw5DlD8qs1TdaWeMQlwmfq96dC8+XISPvS3YRwBd5tI4c9AcrUJB6JhbT0yOrTZy6B9KFzHUQjSujCzarm/UrOqQN8FxF4OwEeTgDqkHEN6cCw0giAUhNeMVOqgZVFD3/f6Y4A9DVr9x7TbT2MrZGeYeenBbzv7Fo3qA+Jd+WRMHhk1piFA7vO2vqtMX2REF4INufyJsssma/S1bLyZVLM6VJoo0ZfKKddI+K3nSk+1vvxGkF24zGl73k/Lzh8fpBV/pPykDjCwa1QqyPJR3UpHEmuVSn8rgIjQegpkiGRGz0DmxT4MA4jNAECgYEA49udpmmemTwNLc5AS331ZJ24HHpS5Wy3vqohIFPKjj4GS9CGos1zGnBT71GK0rRaVIL3QVsnvvvybqoIbXRuujai20OSJ9iJvq7brEYyLAlz4tDh2lhSnEPt9hatIhS1cUFkAGKTiaEV3Gg+3/zFd2HLKPVlzKV2v+RjLitBXg0CgYEAotdPtkhUlEaA7gb0FbuUN6SWOb/PORMzxkD9Ic1OnmvIjxRdhylpM6gRBL42HkyWsXJ13LoOqjb/atnsfSe2ZiSxDRfUR38/WrSb1+WMmlyxxH5LU90QN1baXP6tT3cuIKyeSNfc3NhfrkNkLp2hmsnWQ3KWLCwrpEQPxC0vcYkCgYEAiQw8pCz+wXfHDXfyX/WgtSXP6QEB/xAG7Fzzk7gSKr/PlaYUdLNRueM5+MV41Aa6Ff63rM2g+FQdmsYWT48qUkIubecUb3bkUpZldha6cpY054Vvcp6RAYAyDkPRWqBOCZKlDT49Mxh6R5lDyAEG3CkrwrTmx9H1vLEnnktSA7kCgYBlvUROTO6bHVmcXbfOhD3cbfZ16kMcE8U7TotYvR8rl4fc7QpqUhMqdQz8+6JwV8Wm5C6DU7Op4Wa/aZx5rYAmXTJJTeQRL41zrHfZ8c9g+h0O+SEzKmDhUmBnza6WgY3OWEskk8moKX/OLsi+3zmCriwyQ7tTqd0yalu3Y8vKkQKBgDjgkxlG5WI+v1itfh5ub8iH8mH/p8RJuoTtaJFVzOFQjBpFl00OrrNb yclNrpydlAAV5JLgR3GEYB11ZfWXbAcROgPyvYj4IYLI2q7bpe2vLWS/YQMn8BtD tshfgw/oOJ3UICqkrMaFupDzhsq3wRXncJfh1mIDM4pQ7oqAdmLb"
}

#Resource to Create Key Pair
resource "aws_key_pair" "demo_key_pair" {
  key_name   = var.key_pair_name
  public_key = var.public_key
}

resource "aws_instance" "demo-instance" {
  ami           = "ami-06489866022e12a14"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.demo_key_pair.key_name
}