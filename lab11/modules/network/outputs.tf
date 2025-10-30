output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.subnet.id
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.nsg.id
}

output "nsg_name" {
  description = "The name of the network security group"
  value       = azurerm_network_security_group.nsg.name
}

output "public_ip_id" {
  description = "The ID of the public IP address"
  value       = azurerm_public_ip.pip.id
}

output "public_ip_name" {
  description = "The name of the public IP address"
  value       = azurerm_public_ip.pip.name
}

output "public_ip_address" {
  description = "The actual IP address value"
  value       = azurerm_public_ip.pip.ip_address
}
