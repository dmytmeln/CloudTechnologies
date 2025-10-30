variable "location" {
  type        = string
  description = "The Azure region where the monitoring resources will be created"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where monitoring resources will be created"
}

variable "vm_id" {
  type        = string
  description = "The ID of the virtual machine to be monitored"
}

variable "law_name" {
  type        = string
  description = "The name of the Log Analytics Workspace"
}

variable "dce_name" {
  type        = string
  description = "The name of the Data Collection Endpoint"
}

variable "dcr_name" {
  type        = string
  description = "The name of the Data Collection Rule"
}