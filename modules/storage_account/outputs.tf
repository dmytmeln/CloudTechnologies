output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "storage_account_id" {
  value = azurerm_storage_account.this.id
}

output "primary_location" {
  value = azurerm_storage_account.this.primary_location
}

output "secondary_location" {
  value = azurerm_storage_account.this.secondary_location
}

output "primary_endpoints" {
  value = {
    blob  = azurerm_storage_account.this.primary_blob_endpoint
    file  = azurerm_storage_account.this.primary_file_endpoint
    queue = azurerm_storage_account.this.primary_queue_endpoint
    table = azurerm_storage_account.this.primary_table_endpoint
  }
}

output "lifecycle_rule_name" {
  value = azurerm_storage_management_policy.this.rule[0].name
}

output "lifecycle_rule_id" {
  value = azurerm_storage_management_policy.this.id
}