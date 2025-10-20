output "az104_user1_object_id" {
  description = "Object ID of user az104-user1"
  value       = azuread_user.az104_user1.object_id
}

output "az104_user1_upn" {
  description = "User Principal Name of user az104-user1"
  value       = azuread_user.az104_user1.user_principal_name
}

output "invited_user_object_id" {
  description = "Object ID of the invited user"
  value       = azuread_invitation.external_user.user_id
}

output "invited_user_email" {
  description = "The email address of the user being invited"
  value       = azuread_invitation.external_user.user_email_address
}

output "user_object_ids" {
  description = "Users' IDs that should be added to the group"
  value = [
    azuread_user.az104_user1.object_id,
    azuread_invitation.external_user.user_id
  ]
}
