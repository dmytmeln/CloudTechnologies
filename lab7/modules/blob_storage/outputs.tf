output "container_name" {
  value = azurerm_storage_container.this.name
}

output "container_id" {
  value = azurerm_storage_container.this.id
}

output "retention_policy" {
  value = {
    id      = azurerm_storage_container_immutability_policy.this.id
    enabled = true
    days    = azurerm_storage_container_immutability_policy.this.immutability_period_in_days
  }
}

output "blob_name" {
  value = azurerm_storage_blob.this.name
}

output "blob_id" {
  value = azurerm_storage_blob.this.id
}

output "blob_url" {
  value = azurerm_storage_blob.this.url
}

output "blob_sas_url" {
  value     = "${azurerm_storage_blob.this.url}${data.azurerm_storage_account_blob_container_sas.this.sas}"
  sensitive = true
}
