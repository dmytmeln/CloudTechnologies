data "azurerm_role_definition" "support_request_contributor" {
  name  = "Support Request Contributor"
  scope = var.management_group_id
}

resource "azurerm_role_definition" "custom_support_request" {
  name        = var.custom_role_name
  scope       = var.management_group_id
  description = var.custom_role_description

  permissions {
    actions = data.azurerm_role_definition.support_request_contributor.permissions[0].actions
    not_actions = concat(
      data.azurerm_role_definition.support_request_contributor.permissions[0].not_actions,
      ["Microsoft.Support/register/action"]
    )
  }

  assignable_scopes = [
    var.management_group_id
  ]
}
