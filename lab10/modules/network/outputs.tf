output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "vnet_name" {
  value = azurerm_virtual_network.this.name
}

output "subnet_id" {
  value = azurerm_subnet.this.id
}

output "subnet_name" {
  value = azurerm_subnet.this.name
}

output "nsg_id" {
  value = azurerm_network_security_group.this.id
}

output "nsg_name" {
  value = azurerm_network_security_group.this.name
}

output "pip_id" {
  value = azurerm_public_ip.this.id
}

output "pip_name" {
  value = azurerm_public_ip.this.name
}

output "pip_ip_address" {
  value = azurerm_public_ip.this.ip_address
}

output "nic_id" {
  value = azurerm_network_interface.this.id
}

output "nic_name" {
  value = azurerm_network_interface.this.name
}
