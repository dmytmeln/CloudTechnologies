resource "azurerm_site_recovery_protection_container" "this" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  recovery_vault_name  = var.recovery_vault_name
  recovery_fabric_name = var.recovery_fabric_name
}
