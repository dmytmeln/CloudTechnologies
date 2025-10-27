variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "os_disk_id" {
  description = "ID диска ОС вихідної VM"
  type        = string
}

variable "nic_id" {
  description = "ID NIC вихідної VM"
  type        = string
}

variable "source_recovery_vault_name" {
  type        = string
  description = "Name of the source Recovery Services vault"
}

variable "source_vm_id" {
  type        = string
  description = "ID of the source virtual machine"
}

variable "source_vm_name" {
  type        = string
  description = "Name of the source virtual machine"
}

variable "policy_id" {
  type        = string
  description = "Site Recovery policy ID"
}

variable "target_resource_group" {
  type        = string
  description = "Target resource group name"
}

variable "source_recovery_fabric_name" {
  type        = string
  description = "Name of the source recovery fabric"
}

variable "source_recovery_protection_container_name" {
  type        = string
  description = "Name of the source protection container"
}

variable "target_recovery_fabric_id" {
  type        = string
  description = "ID of the target recovery fabric"
}

variable "target_recovery_protection_container_id" {
  type        = string
  description = "ID of the target protection container"
}

variable "subnet_name" {
  type = string
}

variable "storage_account_id" {
  type = string
}
