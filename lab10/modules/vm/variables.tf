variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location/region"
}

variable "vm_name" {
  type        = string
  description = "VM name prefix"
}

variable "vm_size" {
  type        = string
  description = "Virtual machine size"
}

variable "admin_username" {
  type        = string
  description = "VM admin username"
}

variable "admin_password" {
  type        = string
  description = "VM admin password"
  sensitive   = true
}

variable "nic_id" {
  type        = string
  description = "List of network interface IDs"
}

variable "image_publisher" {
  type        = string
  description = "VM image publisher"
}

variable "image_offer" {
  type        = string
  description = "VM image offer"
}

variable "image_sku" {
  type        = string
  description = "VM image SKU"
}