output "group_id" {
  value = azuread_group.it_lab_administrators.id
}

output "group_display_name" {
  value = azuread_group.it_lab_administrators.display_name
}