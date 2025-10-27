variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location/region"
}

variable "recovery_vault_id" {
  type        = string
  description = "ID of the Recovery Services vault"
}

variable "recovery_vault_name" {
  type        = string
  description = "Name of the Recovery Services vault"
}

variable "vm_id" {
  type        = string
  description = "Virtual machine ID"
}

variable "vm_name" {
  type        = string
  description = "Virtual machine name"
}

variable "policy_name" {
  type        = string
  description = "Backup policy name"
}

variable "timezone" {
  type        = string
  description = "Timezone used by the backup policy"
  default     = "UTC"
}