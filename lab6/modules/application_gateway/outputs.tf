output "name" {
  value = azurerm_application_gateway.this.name
}

output "id" {
  value = azurerm_application_gateway.this.id
}

output "public_ip_name" {
  value = azurerm_public_ip.agw_pip.name
}

output "public_ip_id" {
  value = azurerm_public_ip.agw_pip.id
}

output "public_ip_address" {
  value = azurerm_public_ip.agw_pip.ip_address
}
