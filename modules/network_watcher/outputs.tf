output "nw_id" {
  description = "Network Watcher ID"
  value       = azurerm_network_watcher.this.id
}

output "nw_name" {
  description = "Network Watcher Name"
  value       = azurerm_network_watcher.this.name
}

output "cm_id" {
  description = "Core Monitor ID"
  value       = azurerm_network_connection_monitor.this.id
}

output "cm_name" {
  description = "Core Monitor Name"
  value       = azurerm_network_connection_monitor.this.name
}
