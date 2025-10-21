variable "name" {
  description = "Name of the Virtual Machine Scale Set."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "vm_size" {
  description = "VM SKU size for instances."
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VMSS instances."
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VMSS instances."
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "ID of the subnet for the VMSS network interfaces."
  type        = string
}

variable "zones" {
  description = "A list of availability zones to deploy the VMSS into."
  type        = list(string)
}

variable "nsg_id" {
  description = "ID of the Network Security Group to attach."
  type        = string
}

variable "lb_backend_pool_id" {
  description = "ID of the Load Balancer backend pool to attach."
  type        = string
}
