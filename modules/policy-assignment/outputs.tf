output "assignment_id" {
  description = "ID Policy Assignment"
  value       = azurerm_resource_group_policy_assignment.tag_assignment.id
}

output "assignment_name" {
  description = "Policy Assignment name"
  value       = azurerm_resource_group_policy_assignment.tag_assignment.name
}
