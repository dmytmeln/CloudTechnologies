variable "name" {
  description = "Name of the autoscale setting."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "target_resource_id" {
  description = "The ID of the resource to apply the settings to (e.g., VMSS ID)."
  type        = string
}

variable "min_instances" {
  description = "Minimum number of instances."
  type        = number
}

variable "max_instances" {
  description = "Maximum number of instances."
  type        = number
}

variable "default_instances" {
  description = "Default number of instances."
  type        = number
}
