variable "location" {
  type        = string
  description = "The Azure region where the resources will be created"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the network resources will be created"
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "nsg_name" {
  type        = string
  description = "The name of the network security group"
}

variable "pip_name" {
  type        = string
  description = "The name of the public IP address resource"
}
