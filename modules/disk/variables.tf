variable "resource_group_name" {
  description = "Resource group where disks will be created"
  type        = string
}

variable "location" {
  description = "Azure region for disks"
  type        = string
}

variable "disks" {
  description = "Map of managed disk configurations"
  type = map(object({
    name                 = string
    storage_account_type = string
    create_option        = string
    disk_size_gb         = number
    availability_zone    = optional(string)
  }))
}