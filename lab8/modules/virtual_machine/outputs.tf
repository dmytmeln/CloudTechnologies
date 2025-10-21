output "id" {
  value = azurerm_windows_virtual_machine.main.id
}

output "name" {
  value = azurerm_windows_virtual_machine.main.name
}

output "location" {
  value = azurerm_windows_virtual_machine.main.location
}

output "size" {
  value = azurerm_windows_virtual_machine.main.size
}

output "zone" {
  value = azurerm_windows_virtual_machine.main.zone
}

output "network_interface" {
  value = {
    id         = azurerm_network_interface.vm_nic.id
    name       = azurerm_network_interface.vm_nic.name
    private_ip = azurerm_network_interface.vm_nic.private_ip_address
  }
}
