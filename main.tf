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

module "resource_group" {
  source = "./modules/resource_group"

  name     = var.resource_group_name
  location = var.location
}

module "storage_account" {
  source = "./modules/storage_account"

  resource_group_name  = module.resource_group.name
  location             = var.location
  storage_account_name = var.storage_account_name
  file_share_name      = "fs-cloudshell"
}

module "managed_disks" {
  source = "./modules/disk"

  resource_group_name = module.resource_group.name
  location            = var.location
  disks               = var.managed_disks
}