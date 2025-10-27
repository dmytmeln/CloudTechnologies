output "source_vm_id" {
  value = azurerm_site_recovery_replicated_vm.this.source_vm_id
}

output "replicated_vm_id" {
  value = azurerm_site_recovery_replicated_vm.this.id
}
