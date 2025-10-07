output "nsg_id" {
  value = azurerm_network_security_group.this.id
}

output "nsg_name" {
  value = azurerm_network_security_group.this.name
}

output "inbound_rule_id" {
  value = azurerm_network_security_rule.allow_asg.id
}

output "outbound_rule_id" {
  value = azurerm_network_security_rule.deny_internet.id
}
