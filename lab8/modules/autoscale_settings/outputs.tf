output "id" {
  description = "The ID of the monitor autoscale setting."
  value       = azurerm_monitor_autoscale_setting.this.id
}

output "name" {
  description = "The name of the monitor autoscale setting."
  value       = azurerm_monitor_autoscale_setting.this.name
}
