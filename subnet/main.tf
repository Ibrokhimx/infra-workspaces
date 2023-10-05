terraform {
  cloud {
    organization = "pitt412"

    workspaces {
      name = "infra-subnet"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}



# module aws_vpc{
#   source = "../vpc/"

# }
#locals {
#vpc_id = module.aws_vpc.vpc_id

#}

variable "vpc_id" {
  default = "vpc-0f1622f820f66d774"

}
data "aws_vpc" "main" {
  #id = local.vpc_id
  #id = module.aws_vpc.vpc_id
  id = var.vpc_id
}

variable "subnets" {
  type = map(object({
    cidr_block = string

  }))
  default = {}
}



resource "aws_subnet" "main" {
  for_each   = var.subnets
  vpc_id     = data.aws_vpc.main.id
  cidr_block = each.value.cidr_block #cidrsubnet(data.aws_vpc.main.cidr_block, 4, 1)

  tags = {
    Name = each.key
  }
}
