output "lock_id" {
  description = "ID Resource Lock"
  value       = azurerm_management_lock.resource_group_lock.id
}

output "lock_name" {
  description = "Resource Lock Name"
  value       = azurerm_management_lock.resource_group_lock.name
}

output "lock_level" {
  description = "Lock level for Resource Lock"
  value       = azurerm_management_lock.resource_group_lock.lock_level
}