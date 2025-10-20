variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "az104-rg9c"
}

variable "subscription_id" {
  type = string
}

variable "container_app_name" {
  description = "Container App name"
  type        = string
  default     = "my-app"
}

variable "containerapps_environment_name" {
  description = "Container Apps Environment name"
  type        = string
  default     = "my-environment"
}