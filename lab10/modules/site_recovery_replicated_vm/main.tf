resource "azurerm_site_recovery_replicated_vm" "this" {
  name                           = "${var.source_vm_name}-replicated"
  resource_group_name            = var.resource_group_name
  recovery_vault_name            = var.source_recovery_vault_name
  recovery_replication_policy_id = var.policy_id

  source_vm_id                              = var.source_vm_id
  source_recovery_fabric_name               = var.source_recovery_fabric_name
  source_recovery_protection_container_name = var.source_recovery_protection_container_name

  target_recovery_fabric_id               = var.target_recovery_fabric_id
  target_recovery_protection_container_id = var.target_recovery_protection_container_id

  target_resource_group_id = data.azurerm_resource_group.target_rg.id

  managed_disk {
    disk_id                    = var.os_disk_id
    target_disk_type           = "Standard_LRS"
    target_replica_disk_type   = "Standard_LRS"
    target_resource_group_id   = data.azurerm_resource_group.target_rg.id
    staging_storage_account_id = var.storage_account_id
  }

  network_interface {
    source_network_interface_id = var.nic_id
    target_subnet_name          = var.subnet_name
  }
}


data "azurerm_resource_group" "target_rg" {
  name = var.target_resource_group
}
