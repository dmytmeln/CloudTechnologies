output "lb_name" {
  value = azurerm_lb.this.name
}

output "lb_id" {
  value = azurerm_lb.this.id
}

output "public_ip_name" {
  value = azurerm_public_ip.lb_pip.name
}

output "public_ip_id" {
  value = azurerm_public_ip.lb_pip.id
}

output "public_ip_address" {
  value = azurerm_public_ip.lb_pip.ip_address
}
