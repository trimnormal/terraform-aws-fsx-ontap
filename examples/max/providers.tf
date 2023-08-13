terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.2.0"
    }
  }
  required_version = ">= 1.4.5"
}
provider "aws" {
  region = "us-east-1"
}