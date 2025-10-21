resource "azurerm_managed_disk" "this" {
  name                 = "vm1-disk1"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "StandardSSD_LRS"
  create_option        = "Empty"
  disk_size_gb         = 32
  zone                 = var.zone
}

resource "azurerm_virtual_machine_data_disk_attachment" "vm1_attach_disk" {
  managed_disk_id    = azurerm_managed_disk.this.id
  virtual_machine_id = var.vm_id
  caching            = "ReadWrite"
  lun                = 0
}
