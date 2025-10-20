output "name" {
  value = azurerm_container_app.this.name
}

output "id" {
  value = azurerm_container_app.this.id
}

output "latest_revision_fqdn" {
  description = "FQDN of the latest revision"
  value       = azurerm_container_app.this.latest_revision_fqdn
}

output "outbound_ip_addresses" {
  description = "Public outbound IP addresses"
  value       = try(azurerm_container_app.this.outbound_ip_addresses, [])
}
