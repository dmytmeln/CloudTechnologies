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

output "file_share_name" {
  value = module.storage_account.file_share_name
}

output "disks_details" {
  value = module.managed_disks.disks_details
}
