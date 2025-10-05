variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "az104-rg2"
}

variable "tag_name" {
  description = "Tag Name"
  type        = string
  default     = "Cost Center"
}

variable "tag_value" {
  description = "Tag Value"
  type        = string
  default     = "000"
}

variable "location" {
  description = "Resource Group Location"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Storage Account Name"
  type        = string
  default     = "az104storage2025lab2b"
}