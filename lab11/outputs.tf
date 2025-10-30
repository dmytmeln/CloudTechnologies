output "resource_group" {
  description = "Resource group details"
  value = {
    name = module.resource_group.name
    id   = module.resource_group.id
  }
}

output "virtual_network" {
  description = "Virtual network details"
  value = {
    name = module.network.vnet_name
    id   = module.network.vnet_id
  }
}

output "network_security_group" {
  description = "Network security group details"
  value = {
    name = module.network.nsg_name
    id   = module.network.nsg_id
  }
}

output "public_ip" {
  description = "Public IP address details"
  value = {
    name    = module.network.public_ip_name
    id      = module.network.public_ip_id
    address = module.network.public_ip_address
  }
}

output "storage_account_bootdiag" {
  description = "Storage Account details for boot diagnostics"
  value = {
    name = module.storage.name
    id   = module.storage.id
  }
}

output "network_interface" {
  description = "Network interface details"
  value = {
    name = module.virtual_machine.nic_name
    id   = module.virtual_machine.nic_id
  }
}

output "virtual_machine" {
  description = "Virtual Machine details"
  value = {
    name = module.virtual_machine.vm_name
    id   = module.virtual_machine.vm_id
  }
}

output "log_analytics_workspace" {
  description = "Log Analytics Workspace for VM Insights"
  value = {
    name = module.monitoring.log_analytics_workspace_name
    id   = module.monitoring.log_analytics_workspace_id
  }
}

output "data_collection_rule" {
  description = "Data Collection Rule for VM Insights"
  value = {
    name = module.monitoring.dcr_name
    id   = module.monitoring.dcr_id
  }
}

output "action_group" {
  description = "Action Group for notifying the operations team"
  value = {
    name = module.action_group.name
    id   = module.action_group.id
  }
}

output "alert_processing_rule" {
  description = "Alert processing rule 'Planned Maintenance'"
  value = {
    name = module.alert_processing_rule.name
    id   = module.alert_processing_rule.id
  }
}
