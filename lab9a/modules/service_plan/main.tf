resource "azurerm_service_plan" "this" {
  name                = var.name
  location            = var.location
  os_type             = "Linux"
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_size

  zone_balancing_enabled = false
}
