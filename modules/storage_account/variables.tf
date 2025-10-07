variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "file_share_name" {
  description = "The name of the file share"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where the storage will be created"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}
