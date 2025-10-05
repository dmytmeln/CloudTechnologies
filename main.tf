terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {}

# Module for HelpDesk Group
module "helpdesk_group" {
  source = "./modules/helpdesk"
}

# Module for Management Group
module "management_group" {
  source = "./modules/management-group"

  management_group_id           = var.management_group_id
  management_group_display_name = var.management_group_display_name
}

# Module for RBAC Assignments
module "rbac_assignments" {
  source = "./modules/rbac-assignments"

  management_group_id      = module.management_group.management_group_id
  helpdesk_group_object_id = module.helpdesk_group.helpdesk_group_object_id

  depends_on = [
    module.management_group,
    module.helpdesk_group
  ]
}

# Module for Custom Role
module "custom_role" {
  source = "./modules/custom-role"

  custom_role_name        = var.custom_role_name
  custom_role_description = var.custom_role_description
  management_group_id     = module.management_group.management_group_id

  depends_on = [
    module.management_group
  ]
}