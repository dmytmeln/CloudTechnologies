resource "azurerm_recovery_services_vault" "this" {
  name                = var.vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku_name

  soft_delete_enabled = var.soft_delete_enabled
  storage_mode_type   = "GeoRedundant"
}
