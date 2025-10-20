resource "azuread_group" "helpdesk" {
  display_name     = "Help Desk"
  description      = "Help Desk support team group"
  security_enabled = true
}
