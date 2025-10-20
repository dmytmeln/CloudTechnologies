output "vm_contributor_assignment_id" {
  description = "The ID of the VM Contributor role assignment"
  value       = azurerm_role_assignment.vm_contributor_to_helpdesk.id
}

output "principal_id" {
  description = "The principal ID of the assignment"
  value       = azurerm_role_assignment.vm_contributor_to_helpdesk.principal_id
}

output "assignment_scope" {
  description = "The scope of the role assignment"
  value       = azurerm_role_assignment.vm_contributor_to_helpdesk.scope
}