output "nsg" {
  value = {
    name = azurerm_network_security_group.this.name
    id   = azurerm_network_security_group.this.id
  }
}
