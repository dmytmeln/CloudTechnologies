output "subnet_id" {
  description = "The ID of the created subnet."
  value       = azurerm_subnet.subnet.id
}

output "vnet_id" {
  description = "The ID of the created VNet."
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The name of the created VNet."
  value       = azurerm_virtual_network.vnet.name
}
