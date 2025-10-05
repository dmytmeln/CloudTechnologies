output "custom_role_id" {
  description = "The ID of the custom role"
  value       = azurerm_role_definition.custom_support_request.id
}

output "custom_role_name" {
  description = "The name of the custom role"
  value       = azurerm_role_definition.custom_support_request.name
}

output "role_definition_id" {
  description = "The role definition resource ID"
  value       = azurerm_role_definition.custom_support_request.role_definition_resource_id
}

output "assignable_scopes" {
  description = "The assignable scopes for the custom role"
  value       = azurerm_role_definition.custom_support_request.assignable_scopes
}

output "permissions_summary" {
  description = "Summary of permissions for the custom role"
  value = {
    actions     = azurerm_role_definition.custom_support_request.permissions[0].actions
    not_actions = azurerm_role_definition.custom_support_request.permissions[0].not_actions
  }
}
