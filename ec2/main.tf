terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "pitt412"

    workspaces {
      prefix = "infra-"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

