output "id" {
  description = "The ID of the VMSS."
  value       = azurerm_windows_virtual_machine_scale_set.vmss.id
}

output "name" {
  description = "The name of the VMSS."
  value       = azurerm_windows_virtual_machine_scale_set.vmss.name
}
