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

module "container_instance" {
  source = "./modules/container_instance"

  resource_group_name = module.resource_group.name

  name           = var.container_group_name
  location       = var.location
  container_name = var.container_name
  image          = var.container_image
  dns_name_label = var.dns_name_label
  cpu            = var.container_cpu
  memory         = var.container_memory

}
