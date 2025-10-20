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


module "log_analytics" {
  source = "./modules/log_analytics"

  resource_group_name = module.resource_group.name
  location            = var.location

  depends_on = [module.resource_group]
}


module "containerapps_env" {
  source = "./modules/containerapps_env"

  name                       = var.containerapps_environment_name
  location                   = var.location
  resource_group_name        = module.resource_group.name
  log_analytics_workspace_id = module.log_analytics.id

  depends_on = [module.log_analytics]
}


module "container_app" {
  source = "./modules/container_app"

  name                         = var.container_app_name
  resource_group_name          = module.resource_group.name
  containerapps_environment_id = module.containerapps_env.id

  depends_on = [module.containerapps_env]
}
