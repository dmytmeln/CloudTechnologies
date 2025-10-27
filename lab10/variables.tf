variable "subscription_id" {
  type        = string
  description = "Subscription ID (optional)"
}


variable "location" {
  type        = string
  description = "Location/region"
  default     = "eastus"
}


variable "resource_group_name" {
  type        = string
  description = "Resource group name"
  default     = "az104-rg-region1"
}


variable "virtual_network_name" {
  type        = string
  description = "Virtual network name"
  default     = "az104-10-vnet"
}

variable "vnet_address_prefix" {
  type        = string
  description = "Virtual network address prefix"
  default     = "10.0.0.0/24"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
  default     = "subnet0"
}

variable "subnet_prefix" {
  type        = string
  description = "Subnet address prefix"
  default     = "10.0.0.0/26"
}

variable "nsg_name" {
  type        = string
  description = "Network security group name"
  default     = "az104-10-nsg01"
}

variable "pip_name" {
  type        = string
  description = "Public IP name prefix"
  default     = "az104-10-pip"
}

variable "nic_name" {
  type        = string
  description = "Network interface name prefix"
  default     = "az104-10-nic0"
}

variable "admin_username" {
  type        = string
  description = "VM admin username"
  default     = "localadmin"
}


variable "admin_password" {
  type        = string
  description = "VM admin password"
  sensitive   = true
}

variable "vm_name" {
  type        = string
  description = "VM name prefix"
  default     = "az104-10-vm0"
}

variable "vm_size" {
  type        = string
  description = "Virtual machine size"
  default     = "Standard_B1s"
}

variable "image_publisher" {
  type        = string
  description = "VM image publisher"
  default     = "MicrosoftWindowsServer"
}

variable "image_offer" {
  type        = string
  description = "VM image offer"
  default     = "WindowsServer"
}

variable "image_sku" {
  type        = string
  description = "VM image SKU"
  default     = "2019-Datacenter"
}

variable "vault_name" {
  type        = string
  description = "Vault name"
  default     = "az104-rsv-region1"
}

variable "storage_name" {
  type        = string
  description = "Storage account name"
  default     = "az104lab10dmelnyk2025"
}

variable "secondary_location" {
  type        = string
  description = "Secondary location/region"
  default     = "westus"
}

variable "secondary_resource_group_name" {
  type        = string
  description = "Secondary resource group name"
  default     = "az104-rg-region2"
}
