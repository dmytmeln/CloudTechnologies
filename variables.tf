variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "az104-rg7"
}

variable "subscription_id" {
  type = string
}

variable "storage_account_name" {
  type        = string
  description = "Globally unique storage account name (3..24 lowercase letters and digits)."
  default     = "az104lab7dmelnyk2025"
}

variable "client_ip_address" {
  description = "Your client IP address for access"
  type        = string
}

variable "file_name" {
  description = "Path to the file to upload to blob storage"
  type        = string
  default     = "sample.txt"
}

variable "retention_days" {
  description = "Retention period in days for immutable blob storage"
  type        = number
  default     = 180
}

variable "container_name" {
  description = "Name of the container"
  type        = string
  default     = "data"
}
