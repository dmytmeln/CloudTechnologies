terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
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

  depends_on = [module.resource_group]
}

module "blob_storage" {
  source = "./modules/blob_storage"

  storage_account_name = module.storage_account.storage_account_name
  resource_group_name  = module.resource_group.name

  container_name    = var.container_name
  retention_days    = var.retention_days
  file_name         = var.file_name
  client_ip_address = var.client_ip_address

  depends_on = [module.storage_account]
}


module "file_share" {
  source = "./modules/file_share"

  resource_group_name  = module.resource_group.name
  location             = var.location
  storage_account_name = module.storage_account.storage_account_name

  file_share_name = "share1"

  depends_on = [module.storage_account]
}
