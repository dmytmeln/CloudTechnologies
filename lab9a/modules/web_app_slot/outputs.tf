output "slot_name" {
  value = azurerm_linux_web_app_slot.this.name
}

output "slot_id" {
  value = azurerm_linux_web_app_slot.this.id
}

output "default_site_hostname" {
  value = azurerm_linux_web_app_slot.this.default_hostname
}
