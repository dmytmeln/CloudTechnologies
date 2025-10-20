output "resource_group" {
  description = "Resource Group details"
  value = {
    id       = module.resource_group.id
    name     = module.resource_group.name
    location = module.resource_group.location
    tags     = module.resource_group.tags
  }
}

output "policy_assignment" {
  description = "Policy Assignment details"
  value = {
    id   = module.policy_require_tag.assignment_id
    name = module.policy_require_tag.assignment_name
  }
}

output "policy_inherit_tag" {
  description = "Policy Inherit Tag details"
  value = {
    id                            = module.policy_inherit_tag.assignment_id
    name                          = module.policy_inherit_tag.assignment_name
    remediation_id                = module.policy_inherit_tag.remediation_id
    managed_identity_principal_id = module.policy_inherit_tag.managed_identity_principal_id
  }
}

output "storage_account" {
  description = "Storage Account details"
  value = {
    id      = module.storage_account.id
    name    = module.storage_account.name
    primary = module.storage_account.primary_blob_endpoint
    tags    = module.storage_account.tags
  }
}

output "resource_lock" {
  description = "Resource Lock details"
  value = {
    id    = module.resource_lock.lock_id
    name  = module.resource_lock.lock_name
    level = module.resource_lock.lock_level
  }
}
