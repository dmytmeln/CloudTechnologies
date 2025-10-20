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

module "rg" {
  source = "./modules/resource_group"

  name     = var.resource_group_name
  location = var.location
}

module "vnet_core" {
  source = "./modules/vnet"

  resource_group_name = module.rg.name
  location            = var.location
  vnet_name           = var.core_vnet_name
  vnet_address_space  = [var.core_vnet_address_space]
  subnet_name         = var.core_subnet_name
  subnet_prefix       = var.core_subnet_prefix

  depends_on = [module.rg]
}

module "core_vm" {
  source = "./modules/vm"

  resource_group_name = module.rg.name
  location            = var.location
  vm_name             = var.core_vm_name
  vm_size             = var.core_vm_size
  admin_username      = var.core_vm_admin_username
  admin_password      = var.core_vm_admin_password
  subnet_id           = module.vnet_core.subnet_id

  depends_on = [module.vnet_core]
}

module "vnet_manufacturing" {
  source = "./modules/vnet"

  resource_group_name = module.rg.name
  location            = var.location
  vnet_name           = var.manufacturing_vnet_name
  vnet_address_space  = [var.manufacturing_vnet_address_space]
  subnet_name         = var.manufacturing_subnet_name
  subnet_prefix       = var.manufacturing_subnet_prefix

  depends_on = [module.rg]
}

module "manufacturing_vm" {
  source = "./modules/vm"

  resource_group_name = module.rg.name
  location            = var.location
  vm_name             = var.manufacturing_vm_name
  vm_size             = var.manufacturing_vm_size
  admin_username      = var.manufacturing_vm_admin_username
  admin_password      = var.manufacturing_vm_admin_password
  subnet_id           = module.vnet_manufacturing.subnet_id

  depends_on = [module.vnet_manufacturing]
}

module "network_watcher" {
  source = "./modules/network_watcher"

  resource_group_name     = module.rg.name
  location                = var.location
  name                    = "lab05-network-watcher-${replace(lower(var.location), " ", "")}"
  connection_monitor_name = "cm-core-to-manufacturing"
  source_vm_id            = module.core_vm.vm_id
  source_vm_name          = var.core_vm_name
  destination_vm_id       = module.manufacturing_vm.vm_id
  destination_vm_name     = var.manufacturing_vm_name

  depends_on = [module.core_vm, module.manufacturing_vm]
}

module "vnet_peering" {
  source = "./modules/vnet_peering"

  resource_group_name = module.rg.name

  core_vnet_name = var.core_vnet_name
  core_vnet_id   = module.vnet_core.vnet_id

  manufacturing_vnet_name = var.manufacturing_vnet_name
  manufacturing_vnet_id   = module.vnet_manufacturing.vnet_id

  core_to_manufacturing_name = "CoreServicesVnet-to-ManufacturingVnet"
  manufacturing_to_core_name = "ManufacturingVnet-to-CoreServicesVnet"

  depends_on = [module.network_watcher]
}

module "core_route_table" {
  source = "./modules/route_table"

  resource_group_name = module.rg.name
  location            = var.location
  vnet_name           = var.core_vnet_name

  core_subnet_name        = var.core_subnet_name
  perimeter_subnet_name   = "perimeter"
  perimeter_subnet_prefix = "10.0.1.0/24"

  route_table_name = "rt-CoreServices"
  route_name       = "PerimetertoCore"
  destination_cidr = "10.0.0.0/16"
  next_hop_ip      = "10.0.1.7"

  depends_on = [module.vnet_peering]
}
