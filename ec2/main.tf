terraform {
  cloud {
    organization = "pitt412"

    workspaces {
      name = "ec2"
    }
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

