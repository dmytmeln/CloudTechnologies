output "created_user_id" {
  description = "Created User Object ID"
  value       = module.users.az104_user1_object_id
}

output "created_user_principal_name" {
  description = "Created User Principal Name."
  value       = module.users.az104_user1_upn
}

output "invited_external_user_id" {
  description = "Object ID of invited user"
  value       = module.users.invited_user_object_id
}

output "invited_external_user_email" {
  description = "The email address of the user being invited."
  value       = module.users.invited_user_email
}

output "created_group_id" {
  description = "Created group ID."
  value       = module.groups.group_id
}

output "created_group_name" {
  description = "Created group name."
  value       = module.groups.group_display_name
}
