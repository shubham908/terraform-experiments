terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.19.0"
    }
  }

  backend "s3" {
    bucket = "tf-s3-state-io-shukum"
    key    = "state"
    region = "ap-south-1"
  }
}
