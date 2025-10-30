output "id" {
  description = "The ID of the storage account"
  value       = azurerm_storage_account.sa.id
}

output "name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.sa.name
}

output "primary_blob_endpoint" {
  description = "The primary blob endpoint URL for the storage account"
  value       = azurerm_storage_account.sa.primary_blob_endpoint
}
