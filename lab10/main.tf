terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.47.0"
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

  location              = var.location
  vnet_name             = var.virtual_network_name
  vnet_address_prefix   = var.vnet_address_prefix
  subnet_name           = var.subnet_name
  subnet_address_prefix = var.subnet_prefix
  nsg_name              = var.nsg_name
  pip_name              = var.pip_name
  nic_name              = var.nic_name

  depends_on = [module.resource_group]
}


module "primary" {
  source = "./modules/vm"

  resource_group_name = module.resource_group.name
  nic_id              = module.network.nic_id

  location        = var.location
  vm_name         = var.vm_name
  vm_size         = var.vm_size
  admin_username  = var.admin_username
  admin_password  = var.admin_password
  image_publisher = var.image_publisher
  image_offer     = var.image_offer
  image_sku       = var.image_sku

  depends_on = [module.network]
}

module "recovery" {
  source = "./modules/recovery"


  resource_group_name = module.resource_group.name
  location            = var.location
  vault_name          = var.vault_name
  sku_name            = "Standard"
  soft_delete_enabled = true

  depends_on = [module.primary]
}

module "backup" {
  source = "./modules/backup"

  resource_group_name = module.resource_group.name
  recovery_vault_id   = module.recovery.vault_id
  recovery_vault_name = module.recovery.vault_name
  vm_id               = module.primary.vm_id
  vm_name             = module.primary.vm_name

  location    = var.location
  policy_name = "az104-backup"
  timezone    = "FLE Standard Time"

  depends_on = [module.recovery]
}

module "storage" {
  source = "./modules/storage"

  resource_group_name = module.resource_group.name

  location = var.location
  name     = var.storage_name

  depends_on = [module.backup]
}


module "monitoring" {
  source = "./modules/monitoring"

  resource_group_name = module.resource_group.name
  recovery_vault_id   = module.recovery.vault_id
  storage_account_id  = module.storage.id

  location = var.location
  name     = "LogsAndMetricsToStorage"

  depends_on = [module.recovery, module.storage]
}


module "resource_group_secondary" {
  source = "./modules/resource_group"

  name     = var.secondary_resource_group_name
  location = var.secondary_location

  depends_on = [module.monitoring]
}

module "network_secondary" {
  source = "./modules/network"

  resource_group_name   = module.resource_group_secondary.name
  location              = var.secondary_location
  vnet_name             = "${var.virtual_network_name}-dr"
  vnet_address_prefix   = var.vnet_address_prefix
  subnet_name           = var.subnet_name
  subnet_address_prefix = var.subnet_prefix
  nsg_name              = "${var.nsg_name}-dr"
  pip_name              = "${var.pip_name}-dr"
  nic_name              = "${var.nic_name}-dr"

  depends_on = [module.resource_group_secondary]
}

module "recovery_secondary" {
  source = "./modules/recovery"

  resource_group_name = module.resource_group_secondary.name
  location            = var.secondary_location
  vault_name          = "${var.vault_name}-dr"

  depends_on = [module.resource_group_secondary]
}

module "recovery_fabric_primary" {
  source = "./modules/recovery_fabric"

  name                = "primary-fabric"
  resource_group_name = module.resource_group_secondary.name
  recovery_vault_name = module.recovery_secondary.vault_name
  location            = var.location
}

module "recovery_fabric_secondary" {
  source = "./modules/recovery_fabric"

  name                = "secondary-fabric"
  resource_group_name = module.resource_group_secondary.name
  recovery_vault_name = module.recovery_secondary.vault_name
  location            = var.secondary_location
}

module "protection_container_primary" {
  source = "./modules/protection_container"

  name                 = "primary-protection-container"
  resource_group_name  = module.resource_group_secondary.name
  recovery_vault_name  = module.recovery_secondary.vault_name
  recovery_fabric_name = module.recovery_fabric_primary.name
}

module "protection_container_secondary" {
  source = "./modules/protection_container"

  name                 = "secondary-protection-container"
  resource_group_name  = module.resource_group_secondary.name
  recovery_vault_name  = module.recovery_secondary.vault_name
  recovery_fabric_name = module.recovery_fabric_secondary.name
}

module "asr_policy" {
  source = "./modules/site_recovery_policy"

  resource_group_name = module.resource_group_secondary.name
  location            = var.secondary_location
  recovery_vault_name = module.recovery_secondary.vault_name
  name                = "az104-asr-policy"

  depends_on = [module.recovery_fabric_primary, module.recovery_fabric_secondary]
}

module "protection_container_mapping" {
  source = "./modules/protection_container_mapping"

  name                  = "container-mapping"
  resource_group_name   = module.resource_group_secondary.name
  recovery_vault_name   = module.recovery_secondary.vault_name
  recovery_fabric_name  = module.recovery_fabric_primary.name
  source_container_name = module.protection_container_primary.name
  target_container_id   = module.protection_container_secondary.id
  policy_id             = module.asr_policy.policy_id
}

module "asr_network_mapping" {
  source = "./modules/network_mapping"

  name                = "network-mapping"
  resource_group_name = module.resource_group_secondary.name
  recovery_vault_name = module.recovery_secondary.vault_name
  source_fabric_name  = module.recovery_fabric_primary.name
  target_fabric_name  = module.recovery_fabric_secondary.name
  source_network_id   = module.network.vnet_id
  target_network_id   = module.network_secondary.vnet_id
}

module "replicate_vm" {
  source = "./modules/site_recovery_replicated_vm"

  resource_group_name        = module.resource_group_secondary.name
  source_recovery_vault_name = module.recovery_secondary.vault_name
  source_vm_id               = module.primary.vm_id
  source_vm_name             = module.primary.vm_name
  policy_id                  = module.asr_policy.policy_id
  target_resource_group      = module.resource_group_secondary.name
  storage_account_id         = module.storage.id

  os_disk_id  = module.primary.os_disk_id
  nic_id      = module.primary.nic_id
  subnet_name = module.network_secondary.subnet_name

  source_recovery_fabric_name               = module.recovery_fabric_primary.name
  source_recovery_protection_container_name = module.protection_container_primary.name
  target_recovery_fabric_id                 = module.recovery_fabric_secondary.id
  target_recovery_protection_container_id   = module.protection_container_secondary.id

  depends_on = [
    module.protection_container_mapping,
    module.asr_network_mapping
  ]
}
