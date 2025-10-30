variable "location" {
  type        = string
  description = "The Azure region where the virtual machine will be created"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the VM will be created"
}

variable "vm_name" {
  type        = string
  description = "The name of the virtual machine"
}

variable "nic_name" {
  type        = string
  description = "The name of the network interface"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet where the VM will be attached"
}

variable "public_ip_id" {
  type        = string
  description = "The ID of the public IP address to associate with the VM"
}

variable "nsg_id" {
  type        = string
  description = "The ID of the network security group to associate with the NIC"
}

variable "admin_username" {
  type        = string
  description = "The administrator username for the VM"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "The administrator password for the VM"
}

variable "boot_diagnostics_storage_uri" {
  type        = string
  description = "The storage account URI for boot diagnostics"
}