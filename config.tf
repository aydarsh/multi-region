terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  required_version = "~> 0.14.0"
  
  backend "remote" {
    organization = "test-multi-region"

    workspaces {
      prefix = "core-master-"
    }
  }
}

provider "aws" {
  region = var.region
}
