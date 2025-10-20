terraform {
  required_version = ">= 1.0"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.0"
    }
  }
}

provider "azuread" {
}

data "azuread_client_config" "current" {}

data "azuread_domains" "primary" {
  only_initial = true
}

module "users" {
  source = "./modules/users"

  domain_name         = data.azuread_domains.primary.domains[0].domain_name
  external_user_email = var.external_user_email
  external_user_name  = var.external_user_name
}

module "groups" {
  source = "./modules/groups"

  owner_id              = data.azuread_client_config.current.object_id
  az104_user1_object_id = module.users.az104_user1_object_id
  external_user_id      = module.users.invited_user_object_id
}
