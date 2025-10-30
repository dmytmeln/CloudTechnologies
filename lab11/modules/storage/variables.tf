variable "location" {
  type        = string
  description = "The Azure region where the storage account will be created"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the storage account will be created"
}

variable "storage_account_name_prefix" {
  type        = string
  description = "The prefix for the storage account name (a random string will be appended)"
}