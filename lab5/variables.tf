variable "subscription_id" {
  type = string
}

variable "resource_group_name" {
  type    = string
  default = "az104-rg5"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "core_vnet_name" {
  type    = string
  default = "CoreServicesVnet"
}

variable "core_vnet_address_space" {
  type    = string
  default = "10.0.0.0/16"
}

variable "core_subnet_name" {
  type    = string
  default = "Core"
}

variable "core_subnet_prefix" {
  type    = string
  default = "10.0.0.0/24"
}

variable "core_vm_name" {
  type    = string
  default = "CoreServicesVM"
}

variable "core_vm_size" {
  type    = string
  default = "Standard_DC2s_v3"
}

variable "core_vm_admin_username" {
  type    = string
  default = "localadmin"
}

variable "core_vm_admin_password" {
  type = string
}

variable "manufacturing_vnet_name" {
  type    = string
  default = "ManufacturingVnet"
}

variable "manufacturing_vnet_address_space" {
  type    = string
  default = "172.16.0.0/16"
}

variable "manufacturing_subnet_name" {
  type    = string
  default = "Manufacturing"
}

variable "manufacturing_subnet_prefix" {
  type    = string
  default = "172.16.0.0/24"
}

variable "manufacturing_vm_name" {
  type    = string
  default = "ManufacturingVM"
}

variable "manufacturing_vm_size" {
  type    = string
  default = "Standard_DC2s_v3"
}

variable "manufacturing_vm_admin_username" {
  type    = string
  default = "localadmin"
}

variable "manufacturing_vm_admin_password" {
  type = string
}
