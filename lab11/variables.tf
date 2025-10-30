variable "resource_group_name" {
  type    = string
  default = "az104-rg11"
}

variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "admin_username" {
  type    = string
  default = "localadmin"
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "operations_team_email" {
  type      = string
  sensitive = true
}

variable "local_time_zone" {
  type    = string
  default = "FLE Standard Time"
}

variable "start_time_maintenance" {
  type    = string
  default = "2025-10-30T22:00:00"
}

variable "end_time_maintenance" {
  type    = string
  default = "2025-10-31T07:00:00"
}
