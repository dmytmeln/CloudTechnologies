resource "azurerm_monitor_activity_log_alert" "activity_alert" {
  name                = var.alert_name
  resource_group_name = var.resource_group_name
  location            = var.location
  description         = var.description

  scopes = [
    var.resource_group_id
  ]

  criteria {
    operation_name = "Microsoft.Compute/virtualMachines/delete"
    category       = "Administrative"
  }

  action {
    action_group_id = var.action_group_id
  }
}
