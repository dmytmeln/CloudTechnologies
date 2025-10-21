variable "location" {
  description = "Azure region"
  type        = string
  default     = "polandcentral"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "az104-rg8"
}

variable "subscription_id" {
  type = string
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for VMs (sensitive). Provide via terraform.tfvars or env TF_VAR_admin_password"
  type        = string
  sensitive   = true
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "vm_size2" {
  description = "VM size"
  type        = string
  default     = "Standard_B1ms"
}

variable "vm_disk_type" {
  type    = string
  default = "Premium_LRS"
}
