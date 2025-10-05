data "azurerm_policy_definition" "tag_policy" {
  display_name = "Require a tag and its value on resources"
}

resource "azurerm_resource_group_policy_assignment" "tag_assignment" {
  name                 = "Require Cost Center tag and its value on resources"
  description          = "Require Cost Center tag and its value on all resources in the resource group"
  resource_group_id    = var.scope
  policy_definition_id = data.azurerm_policy_definition.tag_policy.id

  enforce = true

  parameters = jsonencode({
    tagName = {
      value = var.tag_name
    }
    tagValue = {
      value = var.tag_value
    }
  })
}
