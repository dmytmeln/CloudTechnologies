output "policy_name" {
  value = azurerm_backup_policy_vm.this.name
}


output "policy_id" {
  value = azurerm_backup_policy_vm.this.id
}


output "protected_vm_id" {
  value = azurerm_backup_protected_vm.this.id
}
