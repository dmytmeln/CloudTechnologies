variable "alert_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "resource_group_id" {
  type = string
}

variable "description" {
  type    = string
  default = "Alert for virtual machine deletion"
}

variable "action_group_id" {
  type = string
}

variable "location" {
  type = string
}