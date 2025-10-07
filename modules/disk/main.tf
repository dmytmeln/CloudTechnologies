resource "azurerm_managed_disk" "this" {
  for_each = var.disks

  location            = var.location
  resource_group_name = var.resource_group_name

  name                 = each.value.name
  storage_account_type = each.value.storage_account_type
  create_option        = each.value.create_option
  disk_size_gb         = each.value.disk_size_gb
}
