terraform {
  cloud {
    organization = "pitt412"

    workspaces {
      name = "infra-ec2"
    }
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

