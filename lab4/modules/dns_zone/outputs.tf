output "zone_id" {
  value = azurerm_dns_zone.this.id
}

output "zone_name" {
  value = azurerm_dns_zone.this.name
}

output "name_servers" {
  value = azurerm_dns_zone.this.name_servers
}

output "a_records" {
  value = { for k, r in azurerm_dns_a_record.a_records : k => r.records }
}