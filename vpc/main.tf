terraform {
  cloud {
    organization = "pitt412"

    workspaces {
      name = "infravpc"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
