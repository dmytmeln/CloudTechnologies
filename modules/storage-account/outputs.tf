output "id" {
  description = "ID Storage Account"
  value       = azurerm_storage_account.storage.id
}

output "name" {
  description = "Storage Account Name"
  value       = azurerm_storage_account.storage.name
}

output "primary_blob_endpoint" {
  description = "Primary Blob Endpoint"
  value       = azurerm_storage_account.storage.primary_blob_endpoint
}

output "tags" {
  description = "Storage Account Tags"
  value       = azurerm_storage_account.storage.tags
}
