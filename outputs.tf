output "management_group_details" {
  description = "Details of the created management group"
  value = {
    id           = module.management_group.management_group_id
    name         = module.management_group.management_group_name
    display_name = module.management_group.management_group_display_name
  }
}

output "helpdesk_group_details" {
  description = "Details of the helpdesk group"
  value = {
    id           = module.helpdesk_group.helpdesk_group_id
    object_id    = module.helpdesk_group.helpdesk_group_object_id
    display_name = module.helpdesk_group.helpdesk_group_display_name
  }
}

output "rbac_assignments" {
  description = "Details of RBAC assignments"
  value = {
    vm_contributor_assignment = {
      id           = module.rbac_assignments.vm_contributor_assignment_id
      principal_id = module.rbac_assignments.principal_id
      scope        = module.rbac_assignments.assignment_scope
    }
  }
}

output "custom_role_details" {
  description = "Details of the custom role"
  value = {
    id                = module.custom_role.custom_role_id
    name              = module.custom_role.custom_role_name
    role_definition   = module.custom_role.role_definition_id
    assignable_scopes = module.custom_role.assignable_scopes
    permissions       = module.custom_role.permissions_summary
  }
}
