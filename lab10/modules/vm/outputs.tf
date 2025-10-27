output "vm_name" {
  value = azurerm_windows_virtual_machine.this.name
}


output "vm_id" {
  value = azurerm_windows_virtual_machine.this.id
}

output "os_disk_id" {
  description = "ID керованого диска ОС"
  value       = azurerm_windows_virtual_machine.this.os_disk[0].id
}

output "nic_id" {
  description = "ID першого мережевого інтерфейсу"
  value       = azurerm_windows_virtual_machine.this.network_interface_ids[0]
}
