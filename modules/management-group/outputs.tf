output "management_group_id" {
  description = "The ID of the Management Group"
  value       = azurerm_management_group.az104_mg1.id
}

output "management_group_name" {
  description = "The name of the management group"
  value       = azurerm_management_group.az104_mg1.name
}

output "management_group_display_name" {
  description = "The display name of the management group"
  value       = azurerm_management_group.az104_mg1.display_name
}
