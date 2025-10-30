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

  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  vnet_name           = "az104-11-vnet"
  nsg_name            = "az104-11-nsg"
  pip_name            = "az104-11-pip0"

  depends_on = [module.resource_group]
}

module "storage" {
  source = "./modules/storage"

  location                    = module.resource_group.location
  resource_group_name         = module.resource_group.name
  storage_account_name_prefix = "az10411diag"

  depends_on = [module.resource_group]
}

module "virtual_machine" {
  source = "./modules/virtual_machine"

  location                     = module.resource_group.location
  resource_group_name          = module.resource_group.name
  vm_name                      = "az104-11-vm0"
  nic_name                     = "az104-11-nic0"
  subnet_id                    = module.network.subnet_id
  public_ip_id                 = module.network.public_ip_id
  nsg_id                       = module.network.nsg_id
  admin_username               = var.admin_username
  admin_password               = var.admin_password
  boot_diagnostics_storage_uri = module.storage.primary_blob_endpoint

  depends_on = [module.network, module.storage]
}

module "monitoring" {
  source = "./modules/monitoring"

  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  vm_id               = module.virtual_machine.vm_id
  law_name            = "az104-11-law"
  dce_name            = "az104-11-dce"
  dcr_name            = "az104-11-dcr-vminsights"

  depends_on = [module.virtual_machine]
}

module "action_group" {
  source = "./modules/action_group"

  name                = "Alert the operations team"
  display_name        = "AlertOpsTeam"
  resource_group_name = module.resource_group.name
  email_receiver_name = "VM was deleted"
  email_address       = var.operations_team_email

  depends_on = [module.monitoring]
}

module "vm_delete_alert" {
  source = "./modules/alerts"

  alert_name          = "az104-11-alert-DeleteVM"
  resource_group_name = module.resource_group.name
  resource_group_id   = module.resource_group.id
  location            = module.resource_group.location
  action_group_id     = module.action_group.id

  depends_on = [module.action_group]
}

module "alert_processing_rule" {
  source = "./modules/alert_processing_rule"

  rule_name           = "Planned-Maintenance"
  description         = "Suppress notifications during planned maintenance."
  resource_group_name = module.resource_group.name
  scopes              = [module.resource_group.id]

  start_time = var.start_time_maintenance
  end_time   = var.end_time_maintenance
  time_zone  = var.local_time_zone

  depends_on = [module.vm_delete_alert]
}
