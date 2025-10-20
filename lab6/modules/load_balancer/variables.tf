variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "lb_name" {
  type = string
}

variable "frontend_ip_name" {
  type = string
}

variable "backend_address_pool_name" {
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "nics" {
  type = list(object({ id : string, name : string }))
}