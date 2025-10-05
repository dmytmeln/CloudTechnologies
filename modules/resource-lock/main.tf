data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_management_lock" "resource_group_lock" {
  name       = "rg-lock"
  scope      = data.azurerm_resource_group.rg.id
  lock_level = var.lock_level
  notes      = "Prevent deletion of resource group"
}
