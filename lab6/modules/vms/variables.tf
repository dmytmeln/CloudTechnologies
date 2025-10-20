variable "resource_group_name" { type = string }

variable "location" {
  type = string
}

variable "subnets" {
  type = list(object({ id = string, name = string, cidr = list(string) }))
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "vm_size" {
  type = string
}
