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

  vnet_name     = "az104-vnet8"
  subnet_name   = "default"
  address_space = ["10.0.0.0/16"]
  subnet_prefix = ["10.0.1.0/24"]

  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  depends_on = [module.resource_group]
}

module "vm_0" {
  source = "./modules/virtual_machine"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = module.network.subnet_id
  vm_name             = "az104-vm0"
  zone                = "1"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  size                = var.vm_size
  disk_type           = var.vm_disk_type

  depends_on = [module.resource_group, module.network]
}

module "vm_1" {
  source = "./modules/virtual_machine"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = module.network.subnet_id
  vm_name             = "az104-vm1"
  zone                = "2"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  size                = var.vm_size2 # TODO change to vm_size2
  disk_type           = var.vm_disk_type

  depends_on = [module.resource_group, module.network]
}

module "managed_disks" {
  source = "./modules/managed_disks"

  resource_group_name = module.resource_group.name
  location            = var.location
  vm_id               = module.vm_1.id
  zone                = module.vm_1.zone

  depends_on = [module.vm_1]
}

module "networking_vmss" {
  source = "./modules/network"

  vnet_name           = "vmss-vnet"
  subnet_name         = "subnet0"
  address_space       = ["10.82.0.0/20"]
  subnet_prefix       = ["10.82.0.0/24"]
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  depends_on = [module.managed_disks]
}

module "vmss_nsg" {
  source = "./modules/network_security_group"

  name                = "vmss1-nsg"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  depends_on = [module.networking_vmss]
}

module "vmss_lb" {
  source = "./modules/load_balancer"

  name                = "vmss-lb"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  zones               = ["1", "2", "3"]

  depends_on = [module.vmss_nsg]
}

module "vmss1" {
  source = "./modules/vmss"

  name                = "vmss1"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  vm_size             = var.vm_size
  subnet_id           = module.networking_vmss.subnet_id
  zones               = ["1", "2", "3"]
  nsg_id              = module.vmss_nsg.id
  lb_backend_pool_id  = module.vmss_lb.backend_pool_id

  depends_on = [module.vmss_lb, module.vmss_nsg]
}

module "vmss1_autoscale" {
  source = "./modules/autoscale_settings"

  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  target_resource_id  = module.vmss1.id

  name              = "vmss1-autoscale-settings"
  min_instances     = 2
  max_instances     = 10
  default_instances = 2

  depends_on = [module.vmss1]
}
