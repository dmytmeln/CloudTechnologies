output "resource_group" {
  description = "Resource group details"
  value = {
    name = module.resource_group.name
    id   = module.resource_group.id
  }
}


output "storage_account" {
  description = "Storage account details"
  value = {
    name = module.storage_account.storage_account_name
    id   = module.storage_account.storage_account_id
  }
}

output "lifecycle_management_rule" {
  description = "Lifecycle management rule details"
  value = {
    name = module.storage_account.lifecycle_rule_name
    id   = module.storage_account.lifecycle_rule_id
  }
}

output "blob_container" {
  description = "Blob container details"
  value = {
    name             = module.blob_storage.container_name
    id               = module.blob_storage.container_id
    retention_policy = module.blob_storage.retention_policy
  }
}

output "uploaded_blob" {
  description = "Uploaded blob details"
  value = {
    name = module.blob_storage.blob_name
    id   = module.blob_storage.blob_id
    url  = module.blob_storage.blob_url
  }
}

output "blob_sas_url" {
  description = "SAS URL for the uploaded blob with read permissions"
  value       = module.blob_storage.blob_sas_url
  sensitive   = true
}

output "file_share" {
  description = "File share details"
  value       = module.file_share.file_share
}

output "uploaded_file" {
  description = "Uploaded file details"
  value       = module.file_share.uploaded_file
}

output "virtual_network" {
  description = "Virtual network for restricted access"
  value       = module.file_share.virtual_network
}

output "subnet" {
  description = "Subnet with Microsoft.Storage service endpoint"
  value       = module.file_share.subnet
}

output "network_restrictions" {
  description = "Network rules applied to the storage account"
  value       = module.file_share.network_restrictions
}
