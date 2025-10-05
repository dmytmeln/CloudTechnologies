output "assignment_id" {
  description = "ID Policy Assignment"
  value       = azurerm_resource_group_policy_assignment.inherit_tag_assignment.id
}

output "assignment_name" {
  description = "Policy Assignment Name"
  value       = azurerm_resource_group_policy_assignment.inherit_tag_assignment.name
}

output "remediation_id" {
  description = "ID Remediation Task"
  value       = azurerm_resource_group_policy_remediation.inherit_tag_remediation.id
}

output "managed_identity_principal_id" {
  description = "Principal ID Managed Identity"
  value       = azurerm_resource_group_policy_assignment.inherit_tag_assignment.identity[0].principal_id
}