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

resource "aws_cloudtrail" "cloud_ir_trail" {
  name                          = "cloud-ir-trail"
  s3_bucket_name                = aws_s3_bucket.logs.bucket
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true

  event_selector {
    read_write_type           = "All"
    include_management_events = true
  }

  depends_on = [aws_s3_bucket.logs]
}

