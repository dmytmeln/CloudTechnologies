resource "azurerm_virtual_network_peering" "core_to_manufacturing" {
  name                      = var.core_to_manufacturing_name
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.core_vnet_name
  remote_virtual_network_id = var.manufacturing_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "manufacturing_to_core" {
  name                      = var.manufacturing_to_core_name
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.manufacturing_vnet_name
  remote_virtual_network_id = var.core_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}
