data "azurerm_role_definition" "vm_contributor" {
  name  = "Virtual Machine Contributor"
  scope = var.management_group_id
}

resource "azurerm_role_assignment" "vm_contributor_to_helpdesk" {
  scope              = var.management_group_id
  role_definition_id = data.azurerm_role_definition.vm_contributor.id
  principal_id       = var.helpdesk_group_object_id
}
