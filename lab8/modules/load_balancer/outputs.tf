output "id" {
  description = "The ID of the Load Balancer."
  value       = azurerm_lb.lb.id
}

output "name" {
  description = "The name of the Load Balancer."
  value       = azurerm_lb.lb.name
}

output "backend_pool_id" {
  description = "The ID of the LB backend address pool."
  value       = azurerm_lb_backend_address_pool.bap.id
}

output "public_ip_address" {
  description = "The public IP address of the Load Balancer."
  value       = azurerm_public_ip.pip.ip_address
}