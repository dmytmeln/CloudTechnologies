output "helpdesk_group_id" {
  description = "ID of the helpdesk group"
  value       = azuread_group.helpdesk.id
}

output "helpdesk_group_object_id" {
  description = "Object ID of the helpdesk group"
  value       = azuread_group.helpdesk.object_id
}

output "helpdesk_group_display_name" {
  description = "Display name of the helpdesk group"
  value       = azuread_group.helpdesk.display_name
}