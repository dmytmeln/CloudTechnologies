output "id" {
  value = azurerm_resource_group.this.id
}

output "name" {
  value = azurerm_resource_group.this.name
}

output "location" {
  description = "The location of the resource group."
  value       = azurerm_resource_group.this.location
}
