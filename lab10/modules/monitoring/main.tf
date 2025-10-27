resource "azurerm_monitor_diagnostic_setting" "this" {
  name               = var.name
  target_resource_id = var.recovery_vault_id
  storage_account_id = var.storage_account_id

  enabled_log {
    category = "AzureBackupReport"
  }

  enabled_log {
    category = "AddonAzureBackupJobs"
  }

  enabled_log {
    category = "AddonAzureBackupAlerts"
  }

  enabled_log {
    category = "AzureSiteRecoveryJobs"
  }

  enabled_log {
    category = "AzureSiteRecoveryEvents"
  }

  enabled_metric {
    category = "AllMetrics"
  }
}
