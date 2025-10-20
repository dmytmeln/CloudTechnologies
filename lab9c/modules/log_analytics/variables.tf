variable "resource_group_name" {
  description = "Існуюча resource group"
  type        = string
}

variable "location" {
  description = "Region"
  type        = string
}

variable "workspace_name" {
  description = "Log Analytics workspace name"
  type        = string
  default     = "workspaceaz104rg9cb0ef"
}
