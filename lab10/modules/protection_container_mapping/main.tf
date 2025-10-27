resource "azurerm_site_recovery_protection_container_mapping" "this" {
  name                                      = var.name
  resource_group_name                       = var.resource_group_name
  recovery_vault_name                       = var.recovery_vault_name
  recovery_fabric_name                      = var.recovery_fabric_name
  recovery_source_protection_container_name = var.source_container_name
  recovery_target_protection_container_id   = var.target_container_id
  recovery_replication_policy_id            = var.policy_id
}
