resource "azurerm_backup_policy_vm" "this" {
  name                           = var.policy_name
  resource_group_name            = var.resource_group_name
  recovery_vault_name            = var.recovery_vault_name
  timezone                       = var.timezone
  instant_restore_retention_days = 2


  backup {
    time      = "00:00"
    frequency = "Daily"
  }


  retention_daily {
    count = 30
  }
}

resource "azurerm_backup_protected_vm" "this" {
  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = var.vm_id
  backup_policy_id    = azurerm_backup_policy_vm.this.id
}
