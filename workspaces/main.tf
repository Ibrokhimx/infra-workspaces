terraform {
  cloud {
    organization = "pitt412"

    workspaces {
      name = "infra_workspaces"
    }
  }

  required_providers {
    tfe = {
      version = "~> 0.49.0"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
  version = "~> 0.49.0"
}

data "tfe_organization" "summer-cloud" {
  name = "pitt412"
}

locals {
  exec_type = "local"
  infra_components = [
    "vpc",
    "subnet",
    "ec2",
  ]
}

resource "tfe_workspace" "test" {
  for_each       = toset(local.infra_components)
  name           = "infra-${each.key}"
  organization   = data.tfe_organization.summer-cloud.name
  execution_mode = local.exec_type
}