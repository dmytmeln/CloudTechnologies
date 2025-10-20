output "vnet_name" {
  value = azurerm_virtual_network.this.name
}

output "vnet_id" {
  value = azurerm_virtual_network.this.id
}


output "subnets" {
  value = [
    for s in azurerm_subnet.subnets : {
      id   = s.id,
      name = s.name,
      cidr = s.address_prefixes
    }
  ]
}
