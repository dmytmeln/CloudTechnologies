variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vault_name" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "Standard"
}

variable "soft_delete_enabled" {
  type    = bool
  default = true
}
