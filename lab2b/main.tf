terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_subscription" "current" {}

# Module for Resource Group
module "resource_group" {
  source = "./modules/resource-group"

  name      = var.resource_group_name
  location  = var.location
  tag_name  = var.tag_name
  tag_value = var.tag_value
}

# Module for Azure Policy Assignment
module "policy_require_tag" {
  source = "./modules/policy-assignment"

  scope     = module.resource_group.id
  tag_name  = var.tag_name
  tag_value = var.tag_value
}

# Module for Azure Policy Definition
module "policy_inherit_tag" {
  source = "./modules/policy-inherit-tag"

  scope    = module.resource_group.id
  location = var.location
  tag_name = var.tag_name
}

# Module for Storage Account
module "storage_account" {
  source = "./modules/storage-account"

  name                = var.storage_account_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
}

# Module for Resource Lock
module "resource_lock" {
  source = "./modules/resource-lock"

  lock_level          = "CanNotDelete"
  resource_group_name = module.resource_group.name
}
