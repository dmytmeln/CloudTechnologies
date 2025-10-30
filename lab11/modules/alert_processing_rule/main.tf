resource "azurerm_monitor_alert_processing_rule_suppression" "apr" {
  name                = var.rule_name
  resource_group_name = var.resource_group_name
  scopes              = var.scopes
  description         = var.description
  enabled             = true

  schedule {
    effective_from  = var.start_time
    effective_until = var.end_time
    time_zone       = var.time_zone
  }
}