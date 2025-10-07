output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "vnet_name" {
  value = azurerm_virtual_network.this.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.this.address_space
}

output "subnet_ids" {
  description = "Map of subnet name => subnet id"
  value       = { for k, s in azurerm_subnet.this : k => s.id }
}


output "subnet_details" {
  description = "Details of the subnets"
  value = { for k, s in azurerm_subnet.this : k => {
    id             = s.id
    name           = s.name
    address_prefix = s.address_prefixes
    }
  }
}
