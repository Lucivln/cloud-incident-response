terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "random_id" "rand" {
  byte_length = 4
}

resource "aws_s3_bucket" "logs" {
  bucket = "cloud-ir-logs-${random_id.rand.hex}"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name = "incident-response-logs"
  }
}

