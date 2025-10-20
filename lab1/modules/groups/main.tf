resource "azuread_group" "it_lab_administrators" {
  display_name     = "IT Lab Administrators"
  description      = "Administrators that manage the IT lab"
  security_enabled = true

  owners = [
    var.owner_id
  ]
}

resource "azuread_group_member" "external_user_member" {
  group_object_id  = azuread_group.it_lab_administrators.object_id
  member_object_id = var.external_user_id
}

resource "azuread_group_member" "az104_user1_member" {
  group_object_id  = azuread_group.it_lab_administrators.object_id
  member_object_id = var.az104_user1_object_id
}
