data "azurerm_policy_definition" "inherit_tag_policy" {
  display_name = "Inherit a tag from the resource group if missing"
}

resource "azurerm_resource_group_policy_assignment" "inherit_tag_assignment" {
  name                 = "Inherit-Cost-Center-000"
  resource_group_id    = var.scope
  policy_definition_id = data.azurerm_policy_definition.inherit_tag_policy.id
  description          = "Inherit the Cost Center tag and its value 000 from the resource group if missing"

  enforce = true

  parameters = jsonencode({
    tagName = {
      value = var.tag_name
    }
  })

  identity {
    type = "SystemAssigned"
  }

  location = var.location
}

data "azurerm_subscription" "current" {}

data "azurerm_role_definition" "contributor" {
  name  = "Contributor"
  scope = data.azurerm_subscription.current.id
}

resource "azurerm_role_assignment" "policy_remediation" {
  scope              = var.scope
  role_definition_id = data.azurerm_role_definition.contributor.id
  principal_id       = azurerm_resource_group_policy_assignment.inherit_tag_assignment.identity[0].principal_id
}

resource "azurerm_resource_group_policy_remediation" "inherit_tag_remediation" {
  name                 = "remediate-inherit-tag"
  resource_group_id    = var.scope
  policy_assignment_id = azurerm_resource_group_policy_assignment.inherit_tag_assignment.id

  resource_discovery_mode = "ExistingNonCompliant"

  depends_on = [azurerm_role_assignment.policy_remediation]
}
