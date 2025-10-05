variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "management_group_id" {
  description = "Management group ID"
  type        = string
  default     = "az104-mg1"
}

variable "management_group_display_name" {
  description = "Management group display name"
  type        = string
  default     = "az104-mg1"
}

variable "custom_role_name" {
  description = "Name of the custom RBAC role"
  type        = string
  default     = "Custom Support Request"
}

variable "custom_role_description" {
  description = "Description of the custom RBAC role"
  type        = string
  default     = "A custom contributor role for support requests."
}
