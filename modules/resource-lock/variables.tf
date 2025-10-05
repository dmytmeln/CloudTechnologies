variable "resource_group_name" {
  description = "Resource Group Name for Resource Lock"
  type        = string
}

variable "lock_level" {
  description = "Lock level for Resource Lock (CanNotDelete or ReadOnly)"
  type        = string
  default     = "CanNotDelete"

  validation {
    condition     = contains(["CanNotDelete", "ReadOnly"], var.lock_level)
    error_message = "Lock level must be either CanNotDelete or ReadOnly."
  }
}