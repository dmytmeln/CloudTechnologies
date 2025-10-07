variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group to create"
  type        = string
  default     = "az104-rg3"
}

variable "storage_account_name" {
  description = "Globally unique name for the Cloud Shell storage account"
  type        = string
  default     = "cloudshellstoragelab3"
}

variable "managed_disks" {
  description = "Configuration for all managed disks"
  type = map(object({
    name                 = string
    storage_account_type = string
    create_option        = string
    disk_size_gb         = number
  }))

  default = {
    disk1 = {
      name                 = "az104-disk1"
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = 32
    }
    disk2 = {
      name                 = "az104-disk2"
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = 32
    }
    disk3 = {
      name                 = "az104-disk3"
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = 32
    }
    disk4 = {
      name                 = "az104-disk4"
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = 32
    }
    disk5 = {
      name                 = "az104-disk5"
      storage_account_type = "StandardSSD_LRS"
      create_option        = "Empty"
      disk_size_gb         = 32
    }
  }
}
