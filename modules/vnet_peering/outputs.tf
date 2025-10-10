output "core_to_manufacturing_peering_name" {
  value = azurerm_virtual_network_peering.core_to_manufacturing.name
}

output "core_to_manufacturing_peering_id" {
  value = azurerm_virtual_network_peering.core_to_manufacturing.id
}

output "manufacturing_to_core_peering_name" {
  value = azurerm_virtual_network_peering.manufacturing_to_core.name
}

output "manufacturing_to_core_peering_id" {
  value = azurerm_virtual_network_peering.manufacturing_to_core.id
}
