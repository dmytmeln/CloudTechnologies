variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location/region"
}

variable "vnet_name" {
  type        = string
  description = "Virtual network name"
}

variable "vnet_address_prefix" {
  type        = string
  description = "Virtual network address prefix"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
}

variable "subnet_address_prefix" {
  type        = string
  description = "Subnet address prefix"
}

variable "nsg_name" {
  type        = string
  description = "Network security group name"
}

variable "pip_name" {
  type        = string
  description = "Public IP name prefix"
}

variable "nic_name" {
  type        = string
  description = "Network interface name prefix"
}