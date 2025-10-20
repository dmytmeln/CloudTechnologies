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

module "network" {
  source = "./modules/network"

  resource_group_name = module.resource_group.name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnets             = var.subnets

  depends_on = [module.resource_group]
}


module "vms" {
  source = "./modules/vms"

  resource_group_name = module.resource_group.name
  subnets             = module.network.subnets

  location       = var.location
  admin_username = var.admin_username
  admin_password = var.admin_password
  vm_size        = var.vm_size

  depends_on = [module.resource_group, module.network]
}


module "nsg" {
  source = "./modules/nsg"

  resource_group_name = module.resource_group.name
  location            = var.location
  nsg_name            = "lab06-nsg"
  nics                = module.vms.nics

  depends_on = [module.resource_group, module.vms]
}

module "load_balancer" {
  source = "./modules/load_balancer"

  resource_group_name       = module.resource_group.name
  location                  = var.location
  lb_name                   = var.lb_name
  frontend_ip_name          = var.lb_frontend_ip_name
  public_ip_name            = var.lb_public_ip_name
  backend_address_pool_name = var.lb_backend_address_pool_name
  nics                      = module.vms.nics

  depends_on = [module.resource_group, module.vms]
}

module "application_gateway" {
  source = "./modules/application_gateway"

  appgw_name     = "az104-appgw"
  public_ip_name = "az104-gwpip"
  subnet_cidr    = var.appgw_subnet_cidr
  location       = var.location
  vnet_name      = var.vnet_name

  nics                = module.vms.nics
  resource_group_name = module.resource_group.name

  depends_on = [module.resource_group, module.load_balancer]
}
