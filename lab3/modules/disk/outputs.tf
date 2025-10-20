output "disks_details" {
  description = "Details of the managed disks"
  value = { for k, v in azurerm_managed_disk.this : k => {
    id                   = v.id
    name                 = v.name
    size_gb              = v.disk_size_gb
    storage_account_type = v.storage_account_type
    location             = v.location
    create_option        = v.create_option
    }
  }
}
