resource "azurerm_log_analytics_workspace" "law" {
  name                = var.law_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_log_analytics_solution" "vm_insights" {
  solution_name         = "VMInsights"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.law.id
  workspace_name        = azurerm_log_analytics_workspace.law.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/VMInsights"
  }
}

resource "azurerm_monitor_data_collection_endpoint" "dce" {
  name                = var.dce_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Windows"
}

resource "azurerm_monitor_data_collection_rule" "dcr" {
  name                        = var.dcr_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  kind                        = "Windows"
  data_collection_endpoint_id = azurerm_monitor_data_collection_endpoint.dce.id

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.law.id
      name                  = "VMInsightsPerf-Logs-Dest"
    }
  }

  data_flow {
    streams      = ["Microsoft-InsightsMetrics"]
    destinations = ["VMInsightsPerf-Logs-Dest"]
  }

  data_flow {
    streams      = ["Microsoft-ServiceMap"]
    destinations = ["VMInsightsPerf-Logs-Dest"]
  }

  data_sources {
    performance_counter {
      name                          = "VMInsightsPerfCounters"
      streams                       = ["Microsoft-InsightsMetrics"]
      sampling_frequency_in_seconds = 60
      counter_specifiers            = ["\\VmInsights\\DetailedMetrics"]
    }

    extension {
      name           = "DependencyAgentDataSource"
      streams        = ["Microsoft-ServiceMap"]
      extension_name = "DependencyAgent"
    }
  }

  depends_on = [azurerm_monitor_data_collection_endpoint.dce]
}

resource "azurerm_virtual_machine_extension" "ama_agent" {
  name                       = "AzureMonitorWindowsAgent"
  virtual_machine_id         = var.vm_id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorWindowsAgent"
  type_handler_version       = "1.10"
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = true

  depends_on = [azurerm_monitor_data_collection_endpoint.dce]
}

resource "azurerm_monitor_data_collection_rule_association" "dcr_assoc" {
  name                    = "vm-insights-assoc"
  target_resource_id      = var.vm_id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.dcr.id

  depends_on = [
    azurerm_virtual_machine_extension.ama_agent
  ]
}
