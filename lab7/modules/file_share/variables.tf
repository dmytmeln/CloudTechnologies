variable "storage_account_name" {
  type        = string
  description = "Name of the existing storage account"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name where the storage account is located"
}

variable "location" {
  type        = string
  description = "Azure region for related resources"
}

variable "file_share_name" {
  type        = string
  description = "Name of the Azure File share"
  default     = "share1"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network to create for access restriction"
  default     = "vnet1"
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the virtual network"
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  type        = string
  description = "Subnet name inside the virtual network"
  default     = "default"
}

variable "subnet_prefix" {
  type        = string
  description = "Address prefix for the subnet"
  default     = "10.0.0.0/24"
}
