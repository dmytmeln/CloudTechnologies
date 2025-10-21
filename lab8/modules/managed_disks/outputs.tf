output "disk_id" {
  description = "The ID of the managed disk."
  value       = azurerm_managed_disk.this.id
}

output "disk_name" {
  description = "The name of the managed disk."
  value       = azurerm_managed_disk.this.name
}

output "disk_details" {
  description = "Details of the managed disk"
  value = {
    id   = azurerm_managed_disk.this.id
    name = azurerm_managed_disk.this.name
    size = azurerm_managed_disk.this.disk_size_gb
    type = azurerm_managed_disk.this.storage_account_type
  }
}