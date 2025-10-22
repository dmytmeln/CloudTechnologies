variable "location" {
  description = "Azure region"
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "az104-rg9"
}

variable "subscription_id" {
  type = string
}

variable "web_app_name" {
  description = "Globally unique name for web app (must be unique)"
  type        = string
  default     = "dmelnyk-lab09-webapp-unique-001"
}

variable "app_service_plan_name" {
  description = "Name of App Service Plan"
  type        = string
  default     = "lab09-appserviceplan"
}

variable "slot_name" {
  type        = string
  description = "Name of the deployment slot (e.g. staging)"
  default     = "staging"
}

variable "app_service_sku_size" {
  description = "SKU size for App Service Plan"
  type        = string
  default     = "S1"
}

variable "repo_url" {
  type    = string
  default = "https://github.com/Azure-Samples/php-docs-hello-world"
}

variable "branch" {
  type    = string
  default = "master"
}
