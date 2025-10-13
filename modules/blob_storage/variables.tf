variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "container_name" {
  description = "Name of the blob container"
  type        = string
}

variable "blob_relative_path" {
  type        = string
  description = "Path (within container) where the blob will be uploaded, e.g. 'securitytest/sample.txt'."
  default     = "securitytest/sample.txt"
}

variable "retention_days" {
  description = "Retention period in days for immutable blob storage"
  type        = number
  default     = 180
}

variable "file_name" {
  description = "Path to the file to upload"
  type        = string
}

variable "client_ip_address" {
  type = string
}