output "perimeter_subnet_id" {
  value = azurerm_subnet.perimeter.id
}

output "route_table_id" {
  value = azurerm_route_table.this.id
}

output "route_id" {
  value = azurerm_route.perimeter_to_core.id
}
