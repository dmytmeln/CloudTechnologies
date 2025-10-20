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
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
}

module "vnets" {
  source   = "./modules/vnet"
  for_each = var.vnets

  location            = var.location
  resource_group_name = module.resource_group.name

  name          = each.value.name
  address_space = each.value.address_space
  subnets       = each.value.subnets

  depends_on = [module.resource_group]
}

module "asg_web" {
  source = "./modules/asg"

  resource_group_name = module.resource_group.name

  name     = var.asg_name
  location = var.location

  depends_on = [module.resource_group]
}

module "nsg_secure" {
  source = "./modules/nsg"

  resource_group_name = module.resource_group.name

  name      = var.nsg_name
  location  = var.location
  asg_id    = module.asg_web.asg_id
  subnet_id = module.vnets["core"].subnet_ids["SharedServicesSubnet"]

  depends_on = [module.resource_group, module.vnets, module.asg_web]
}

module "dns_public" {
  source = "./modules/dns_zone"

  resource_group_name = module.resource_group.name

  name = var.public_dns_zone_name

  a_records = var.public_dnz_zone_a_records

  depends_on = [module.nsg_secure]
}

module "dns_private" {
  source = "./modules/private_dns_zone"

  resource_group_name = module.resource_group.name

  name = var.private_dns_zone_name

  a_records = var.private_dnz_zone_a_records

  depends_on = [module.nsg_secure]
}
