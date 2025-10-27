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


output "public_ip_addresses" {
  description = "Public IP addresses"
  value       = module.network.pip_ip_address
}


output "network_interfaces" {
  description = "Network interface IDs (list)"
  value       = module.network.nic_id
}


output "virtual_machine" {
  description = "Virtual machine details"
  value = {
    name = module.primary.vm_name
    id   = module.primary.vm_id
  }
}

output "recovery_vault" {
  description = "Recovery Services vault details"
  value = {
    name = module.recovery.vault_name
    id   = module.recovery.vault_id
  }
}

output "backup_policy" {
  description = "Backup policy details"
  value = {
    name = module.backup.policy_name
    id   = module.backup.policy_id
  }
}

output "protected_vm" {
  description = "Backup protected VM details"
  value = {
    id = module.backup.protected_vm_id
  }
}

output "storage_account" {
  description = "Storage account details"
  value = {
    name = module.storage.name
    id   = module.storage.id
  }
}

output "diagnostic_setting" {
  description = "Diagnostic setting for Recovery Services vault"
  value = {
    name = module.monitoring.diagnostic_name
    id   = module.monitoring.diagnostic_id
  }
}

output "recovery_vault_secondary" {
  description = "Secondary Recovery Services vault details"
  value = {
    name = module.recovery_secondary.vault_name
    id   = module.recovery_secondary.vault_id
  }
}


output "site_recovery_policy" {
  description = "Site Recovery replication policy details"
  value = {
    name = module.asr_policy.policy_name
    id   = module.asr_policy.policy_id
  }
}

output "replicated_vm" {
  description = "Replicated VM details"
  value = {
    source_vm_id = module.replicate_vm.source_vm_id
    id           = module.replicate_vm.replicated_vm_id
  }
}
